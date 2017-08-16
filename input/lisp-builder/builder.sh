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
nix_asdf="${nix_asdf:?}"
#lisp="${lisp:?}"
out="${out:?}"
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
        printf ' (:include "%s/common-lisp/source-registry/%s.conf")\n' "$dependency" "$(basename $lisp)"
    done
    printf ' :ignore-inherited-configuration)'
}

bundleInputTranslations() {
    printf '(:source-registry\n(:tree "%s")\n' "$bundleOut"
    for dependency in $lisp_dependencies; do
        printf ' (:include "%s/common-lisp/source-registry/%s.conf")\n' "$dependency" "$(basename $lisp)"
    done
    printf ' :ignore-inherited-configuration)'
}
    

oldPreConfigure="$preConfigure"
preConfigure() {
    eval "$oldPreConfigure"

    mkdir -p "$out/common-lisp/source-registry"
    mkdir -p "$out/common-lisp/bin-cache"
    mkdir -p "$out/bin"
    
}

generateBundle() {
    if test -n "$NoBundle"; then
	return 1
    fi
    CL_SOURCE_REGISTRY="$(sourceProjectInputTranslations)" \
		      ASDF_OUTPUT_TRANSLATIONS="$(buildTimeOutputTranslations)" \
		      LD_LIBRARY_PATH="$NIX_LD_LIBRARY_PATH" \
		      $lisp $NIX_LISP_EARLY_OPTS $NIX_LISP_LOAD_FILE "$asdf_path" $NIX_LISP_LOAD_FILE "$nix_asdf" \
		      $NIX_LISP_EXEC_CODE "(nix-asdf:make-bundle \"$systemName\" \"$bundleOut\")"
    if ! test -e $bundleOut/*.asd; then return 1; fi
    bundleInputTranslations > "$out/common-lisp/source-registry/$(basename $lisp).conf"
    awk 'tolower($0) ~ /defsystem / { exit 0} {print }' $bundleOut/originalasd.txt >> prependme.txt || return 1
    cat prependme.txt $bundleOut/*.asd > bundle.asd
    cp bundle.asd $bundleOut/*.asd
    testBuild
}

setupEnvForLisp() {
    case "$(basename "$lisp")" in
	sbcl)
	    NIX_LISP_EARLY_OPTS="--no-sysinit --no-userinit"
	    NIX_LISP_LOAD_FILE="--load"
	    NIX_LISP_EXEC_CODE="--eval"
	    NIX_LISP_FINAL_PARAMETERS=""
	    ;;
	ccl|lx86cl64|lx86cl)
	    NIX_LISP_EARLY_OPTS="--no-init"
	    NIX_LISP_LOAD_FILE="--load"
	    NIX_LISP_EXEC_CODE="--eval"
	    NIX_LISP_FINAL_PARAMETERS=""
	    ;;
	ecl)
	    NIX_LISP_EARLY_OPTS="-norc"
	    NIX_LISP_LOAD_FILE="--load"
	    NIX_LISP_EXEC_CODE="--eval"
	    NIX_LISP_FINAL_PARAMETERS=""
	    ;;
	lisp)
	    NIX_LISP_EARLY_OPTS="-noinit -nositeinit"
	    NIX_LISP_LOAD_FILE="-load"
	    NIX_LISP_EXEC_CODE="-eval"
	    NIX_LISP_FINAL_PARAMETERS=""
	    ;;
	clisp)
	    NIX_LISP_EARLY_OPTS="-norc"
	    NIX_LISP_LOAD_FILE="-i"
	    NIX_LISP_EXEC_CODE="-x"
	    NIX_LISP_FINAL_PARAMETERS="-repl"
	    ;;
	*)
	    printf 'Unknown lisp executable: %s\n' "$lisp"
	    return 1
	    ;;
    esac
}

generateRunScript() {

    cat <<EOF > "$out/bin/$bin_name"
#!/bin/sh
CL_SOURCE_REGISTRY='$(printf '(:source-registry (:include "%s/common-lisp/source-registry/%s.conf"):ignore-inherited-configuration)' "$out" "$(basename $lisp)")' \
LD_LIBRARY_PATH='$NIX_LD_LIBRARY_PATH' \
$lisp $NIX_LISP_EARLY_OPTS $NIX_LISP_LOAD_FILE $asdf_path $NIX_LISP_FINAL_PARAMETERS "\$@"
EOF

#cat - "$out/bin/$bin_name" >&2 <<EOF
#$lisp_name binary
#EOF

chmod +x "$out/bin/$bin_name"

}

generateSourceProject() {
	echo "Unable to build bundle for: $systemName" >&2
	sourceProjectInputTranslations > "$out/common-lisp/source-registry/$(basename $lisp).conf"
	testBuild
}

buildForLisp() {
    lisp="$1"
    bin_name="$(basename "$lisp")-$(echo "$systemName"| tr -c '[:alnum:]\n' '-')"
    bundleOut="$out/common-lisp/$(basename "$lisp")-bundle"
    mkdir -p $bundleOut
    setupEnvForLisp "$lisp"

    generateRunScript
    generateBundle > "$bundleOut/bundleoutput" 2>&1 || generateSourceProject
}
    
buildPhase() {
    eval "$preBuild"


    if test -z "$lisp_implementations"; then
	printf "No implementations for package!\n" >&2
	printf 'Nix Build failed with all lisps\n' >&2
	return 1
    fi

    for impl in $lisp_implementations; do
	lisp="$(find "$impl/bin" -type f -executable \( -name sbcl -o -name ccl -o -name clisp -o -name lisp -o -name ecl -o -name 'lx*cl*' \) -print -quit)"
	if test -z "$lisp"; then
	    printf 'Unable to find executable in %s\n' "$impl"
	    return 1
	fi

	printf 'Starting build for lisp %s\n' $lisp >&2

	if buildForLisp "$lisp"; then
	    printf 'Successful build for lisp %s\n' "$lisp" >&2
	    someBuildSuccesses=yes
	else
	    printf 'Failed build for lisp %s\n' "$lisp" >&2
	    someBuildErrors=yes
	fi
    done
    if test -z "$someBuildSuccesses"; then
	printf 'Nix Build failed with all lisps\n' >&2
    fi

    test -z "$someBuildErrors"
}

testBuild() {
    echo "Testing bundle for $systemName:" >&2
    
    mkdir -p "$NIX_BUILD_TOP/fakehome"
    DISPLAY=:0 HOME="$NIX_BUILD_TOP/fakehome" "$out/bin/$bin_name" $NIX_LISP_LOAD_FILE "$nix_asdf" $NIX_LISP_EXEC_CODE "(nix-asdf:test-bundle \"$systemName\")"
}

installPhase() {
    :
}

genericBuild
