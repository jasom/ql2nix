
{ buildLispPackage, stdenv, fetchurl, lisp-project_varjo, 
   lisp_vas-string-metrics, lisp_named-readtables, lisp_split-sequence, lisp_glsl-symbols, lisp_parse-float, lisp_glsl-spec, lisp_cl-ppcre, lisp_fn,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_vas-string-metrics lisp_named-readtables lisp_split-sequence lisp_glsl-symbols lisp_parse-float lisp_glsl-spec lisp_cl-ppcre lisp_fn  ];
      inherit stdenv;
      systemName = "varjo";
      
      sourceProject = "${lisp-project_varjo}";
      patches = [];
      lisp_dependencies = "${lisp_vas-string-metrics} ${lisp_named-readtables} ${lisp_split-sequence} ${lisp_glsl-symbols} ${lisp_parse-float} ${lisp_glsl-spec} ${lisp_cl-ppcre} ${lisp_fn}";
      name = "lisp_varjo-release-quicklisp-525a7693-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
