:

addLdPath() {
    if [ -d "$1/lib64" ] && [ ! -L "$1/lib64" ]; then
        export NIX_LD_LIBRARY_PATH+="${NIX_LD_LIBRARY_PATH+:}$1/lib64"
    fi

    if [ -d "$1/lib" ]; then
        export NIX_LD_LIBRARY_PATH+="${NIX_LD_LIBRARY_PATH+:}$1/lib"
    fi
}

envHooks+=(addLdPath)

# shellcheck disable=SC1090
. "${stdenv:?}/setup"

# Check our inputs
lisp_dependencies="${lisp_dependencies?}"
lisp_name="${lisp_name:?}"
nix_asdf="${nix_asdf:?}"
lisp_name="${systemName:?}"
bin_name="$(echo "$lisp_name"| tr -c '[:alnum:]\n' '-')"
lisp="${lisp:?}"
asdf="${asdf:?}"
out="${out:?}"
#bash="$(command -v sh)"

asdf_path="${asdf_path:?}"

declare preConfigure
declare preBuild

oldPreConfigure="$preConfigure"
preConfigure() {
    eval "$oldPreConfigure"

    mkdir -p "$out/common-lisp/source-registry"
    mkdir -p "$out/common-lisp/bin-cache"
    mkdir -p "$out/common-lisp/source"
    mkdir -p "$out/common-lisp/output-translations"
    mkdir -p "$out/bin"
    printf '(:output-translations\n("%s/common-lisp/source/" (:function nix-asdf:calculate-translation))' "$out" \
        > "$out/common-lisp/output-translations/nix.conf"
    printf '(:source-registry\n(:tree "%s")' "$out/common-lisp/source/" > "$out/common-lisp/source-registry/nix.conf"
    for dependency in $lisp_dependencies; do
        #dependency="$(eval printf '%s' "\${$dependency}")"
        printf ' (:include "%s")\n' "$dependency/common-lisp/output-translations/nix.conf" \
            >> "$out/common-lisp/output-translations/nix.conf"
        printf ' (:include "%s/common-lisp/source-registry/nix.conf")\n' "$dependency" \
            >> "$out/common-lisp/source-registry/nix.conf"
    done
    printf ':ignore-inherited-configuration)' \
        >> "$out/common-lisp/source-registry/nix.conf"
    printf ':ignore-inherited-configuration)' \
        >> "$out/common-lisp/output-translations/nix.conf"
}


buildPhase() {
    eval "$preBuild"
    cp -a ./* "$out/common-lisp/source/"
    cat <<EOF > "$out/bin/$bin_name"
#!/bin/sh
NIX_LISP="\${NIX_LISP:-$lisp}"
export CL_SOURCE_REGISTRY='(:source-registry (:include "$out/common-lisp/source-registry/nix.conf"):ignore-inherited-configuration)'
export NIX_ASDF_OUTPUT_TRANSLATIONS='(:output-translations (:include "$out/common-lisp/output-translations/nix.conf") :ignore-inherited-configuration)'
LD_LIBRARY_PATH='$NIX_LD_LIBRARY_PATH' \$NIX_LISP --load $asdf_path --load $nix_asdf "\$@"
EOF

cat - "$out/bin/$bin_name" >&2 <<EOF
$lisp_name binary
EOF

chmod +x "$out/bin/$bin_name"
"$out/bin/$bin_name" <<EOF
(progn
 (setf nix-asdf::*store-writable* "$out/")
 (asdf:clear-output-translations)
 (asdf:initialize-output-translations
  (uiop:getenv "NIX_ASDF_OUTPUT_TRANSLATIONS"))
 nil)
 (trace asdf::compute-action-stamp)
#+sbcl(setf SB-IMPL::*DEFAULT-EXTERNAL-FORMAT* :utf-8)
(handler-case 
  (asdf:load-system "$systemName")
  (error (condition)
  (let ((*print-readably* nil))
  (terpri *error-output*)

  (print condition *error-output*)
  (princ condition *error-output*)
  (describe condition *error-output*)
  (terpri *error-output*)
  )
     
  #-(or)(uiop:quit 1)))
(uiop:quit)
EOF
}

installPhase() {
    :
}

genericBuild
