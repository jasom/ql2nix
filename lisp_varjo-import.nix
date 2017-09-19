
{ buildLispPackage, stdenv, fetchurl, lisp-project_varjo, 
   lisp_rtg-math-vari, lisp_fare-quasiquote-extras, lisp_optima, lisp_glsl-toolkit, lisp_fn, lisp_cl-ppcre, lisp_glsl-spec, lisp_parse-float, lisp_glsl-symbols, lisp_split-sequence, lisp_named-readtables, lisp_vas-string-metrics,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rtg-math-vari lisp_fare-quasiquote-extras lisp_optima lisp_glsl-toolkit lisp_fn lisp_cl-ppcre lisp_glsl-spec lisp_parse-float lisp_glsl-symbols lisp_split-sequence lisp_named-readtables lisp_vas-string-metrics  ];
      inherit stdenv;
      systemName = "varjo.import";
      
      sourceProject = "${lisp-project_varjo}";
      patches = [];
      lisp_dependencies = "${lisp_rtg-math-vari} ${lisp_fare-quasiquote-extras} ${lisp_optima} ${lisp_glsl-toolkit} ${lisp_fn} ${lisp_cl-ppcre} ${lisp_glsl-spec} ${lisp_parse-float} ${lisp_glsl-symbols} ${lisp_split-sequence} ${lisp_named-readtables} ${lisp_vas-string-metrics}";
      name = "lisp_varjo-import-release-quicklisp-b46bcb0d-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
