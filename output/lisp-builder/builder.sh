. "$stdenv/setup"

oldPreConfigure="$preConfigure"
preConfigure() {
    eval "$oldPreConfigure"

    mkdir -p "$out/common-lisp/source-registry"
    mkdir -p "$out/common-lisp/bin-cache"
    mkdir -p "$out/common-lisp/source"
    mkdir -p "$out/common-lisp/output-translations"
    mkdir -p "$out/bin"
    printf '(:output-translations\n' > "$out/common-lisp/output-translations/nix.conf"
    printf '(:source-registry\n' > "$out/common-lisp/source-registry/nix.conf"
    for dependency in $lisp_dependencies; do
        #dependency="$(eval printf '%s' "\${$dependency}")"
        printf ' (:include "%s")\n' "$dependency/common-lisp/output-translations/nix.conf" \
            >> "$out/common-lisp/output-translations/nix.conf"
        printf ' (:include "%s/common-lisp/source-registry/nix.conf")\n' "$dependency" \
            >> "$out/common-lisp/source-registry/nix.conf"
    done
    printf '(:tree "%s"):ignore-inherited-configuration)' "$out/common-lisp/source/" \
        >> "$out/common-lisp/source-registry/nix.conf"
    printf '("%s/common-lisp/source/" ("%s/common-lisp/bin-cache/" :implementation :**/ :*.*.*)):ignore-inherited-configuration)' "$out" "$out" \
        >> "$out/common-lisp/output-translations/nix.conf"
}


buildPhase() {
    eval "$preBuild"
    if test "$systemName" "qt"; then
        command -v qmake
    fi
    cp -a ./* "$out/common-lisp/source/"
    cat <<EOF > "$out/bin/$lisp_name"
#!/bin/sh
NIX_LISP="\${NIX_LISP:-$lisp}"
export CL_SOURCE_REGISTRY='(:source-registry (:include "$out/common-lisp/source-registry/nix.conf"):ignore-inherited-configuration)'
export ASDF_OUTPUT_TRANSLATIONS='(:output-translations (:include "$out/common-lisp/output-translations/nix.conf"):ignore-inherited-configuration)'
echo \$NIX_LISP >&2
LD_LIBRARY_PATH='$LD_LIBRARY_PATH' \$NIX_LISP "\$@"
EOF

echo "SBCL: $sbcl" >&2

cat - "$out/bin/$lisp_name" >&2 <<EOF
$lisp_name binary
EOF

chmod +x "$out/bin/$lisp_name"
"$out/bin/$lisp_name" <<EOF
#-asdf(load "$asdf/lib/common-lisp/asdf/build/asdf.lisp")
(handler-case 
  (asdf:load-system "$systemName")
  (error (condition)
  (let ((*print-readably* nil))
  (terpri *error-output*)
  (print condition *error-output*)
  (describe condition *error-output*)
  (terpri *error-output*)
  )
     
  #-(or)(uiop:quit 1)))
(uiop:quit)
EOF
#then
#"$out/bin/$lisp_name" <<EOF
##-asdf(load "$asdf/lib/common-lisp/asdf/build/asdf.lisp")
#(asdf:load-system "cffi")
#(let (libs)
#       (handler-bind
#         ((cffi:load-foreign-library-error
#            (lambda (condition)
#              (push (car (simple-condition-format-arguments condition)) libs)
#              (invoke-restart 'asdf/action:accept)))
#          (uiop/lisp-build:compile-file-error
#            (lambda (condition)
#            (invoke-restart 'asdf/action:accept)))
#          (uiop/run-program::subprocess-error
#            (lambda (condition)
#              (invoke-restart 'continue)))
#          (t
#            (lambda (condition)
#              (let ((*print-readably* nil))
#              (print condition))
#              (invoke-restart 'asdf/action:accept))))
#         (asdf:load-system "$systemName"))
#   (mapcar (lambda (x) (format *error-output* "~&MISSING_LIB: ~A~%" (slot-value (cffi::get-foreign-library x) 'cffi::spec))) libs))
#EOF
#false
#fi
}

installPhase() {
    :
}

genericBuild
