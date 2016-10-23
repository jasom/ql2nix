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
sourceProject="${sourceProject:?}"
systemName="${systemName:?}"
lisp_dependencies="${lisp_dependencies?}"
lisp_name="${lisp_name:?}"
nix_asdf="${nix_asdf:?}"
bin_name="$(echo "$lisp_name"| tr -c '[:alnum:]\n' '-')"
lisp="${lisp:?}"
out="${out:?}"
bundleOut="$out/common-lisp/bundle"
#bash="$(command -v sh)"

asdf_path="${asdf_path:?}"

declare preConfigure
declare preBuild

unpackPhase() {
    :
}

buildTimeOutputTranslations() {
    printf '/:%s/.cache/' "$NIX_BUILD_TOP"
    #printf '(:output-translations
    #          :ignore-inherited-configuration
    #          (t "%s/.cache/**/*.*"))' "$NIX_BUILD_TOP"
}

sourceProjectInputTranslations() {
    printf '(:source-registry\n(:tree "%s")\n' "$sourceProject/common-lisp/source/"
    for dependency in $lisp_dependencies; do
        printf ' (:include "%s/common-lisp/source-registry/nix.conf")\n' "$dependency"
    done
    printf ' :ignore-inherited-configuration)'
}

bundleInputTranslations() {
    printf '(:source-registry\n(:tree "%s")\n' "$bundleOut"
    for dependency in $lisp_dependencies; do
        printf ' (:include "%s/common-lisp/source-registry/nix.conf")\n' "$dependency"
    done
    printf ' :ignore-inherited-configuration)'
}
    

oldPreConfigure="$preConfigure"
preConfigure() {
    eval "$oldPreConfigure"

    mkdir -p "$out/common-lisp/source-registry"
    mkdir -p "$out/common-lisp/bin-cache"
    mkdir -p "$out/bin"
    
    #bundleInputTranslations > "$out/common-lisp/source-registry/nix.conf"
    #printf '(:source-registry\n(:tree "%s")' "$sourceProject/common-lisp/source/" > "$out/common-lisp/source-registry/nix.conf"
    #for dependency in $lisp_dependencies; do
        #printf ' (:include "%s/common-lisp/source-registry/nix.conf")\n' "$dependency" \
            #>> "$out/common-lisp/source-registry/nix.conf"
    #done
    #printf ':ignore-inherited-configuration)' \
        #>> "$out/common-lisp/source-registry/nix.conf"
    #printf ':ignore-inherited-configuration)' \
        #>> "$out/common-lisp/output-translations/nix.conf"
}

generateBundle() {
    CL_SOURCE_REGISTRY="$(sourceProjectInputTranslations)" \
		      ASDF_OUTPUT_TRANSLATIONS="$(buildTimeOutputTranslations)" \
		      LD_LIBRARY_PATH="$NIX_LD_LIBRARY_PATH" \
		      $lisp --load "$asdf_path" --load "$nix_asdf" \
		      --eval "(nix-asdf:make-bundle \"$systemName\" \"$bundleOut\")"
    bundleInputTranslations > "$out/common-lisp/source-registry/nix.conf"
    awk 'tolower($0) ~ /defsystem / { exit 0} {print }' $bundleOut/originalasd.txt >> prependme.txt
    cat prependme.txt $bundleOut/*.asd > bundle.asd
    cp bundle.asd $bundleOut/*.asd
    testBuild
}

generateRunScript() {

    cat <<EOF > "$out/bin/$bin_name"
#!/bin/sh
CL_SOURCE_REGISTRY='$(printf '(:source-registry (:include "%s/common-lisp/source-registry/nix.conf"):ignore-inherited-configuration)' "$out")' \
LD_LIBRARY_PATH='$NIX_LD_LIBRARY_PATH' \
$lisp --load $asdf_path "\$@"
EOF

#cat - "$out/bin/$bin_name" >&2 <<EOF
#$lisp_name binary
#EOF

chmod +x "$out/bin/$bin_name"

}

generateSourceProject() {
	echo "Unable to build bundle for: $systemName" >&2
	sourceProjectInputTranslations > "$out/common-lisp/source-registry/nix.conf"
	testBuild
}

buildPhase() {
    eval "$preBuild"

    echo "Building bundle for $systemName:" >&2

    generateRunScript

    generateBundle || generateSourceProject


}

testBuild() {
    echo "Testing bundle for $systemName:" >&2
    
    mkdir -p "$NIX_BUILD_TOP/fakehome"
    DISPLAY=:0 HOME="$NIX_BUILD_TOP/fakehome" "$out/bin/$bin_name" --load "$nix_asdf" --eval "(nix-asdf:test-bundle \"$systemName\")"
}

installPhase() {
    :
}

genericBuild
