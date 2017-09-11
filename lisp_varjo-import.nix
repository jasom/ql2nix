
{ buildLispPackage, stdenv, fetchurl, lisp-project_varjo, 
   lisp_varjo, lisp_glsl-toolkit, lisp_optima, lisp_fare-quasiquote-extras, lisp_rtg-math-vari,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_varjo lisp_glsl-toolkit lisp_optima lisp_fare-quasiquote-extras lisp_rtg-math-vari  ];
      inherit stdenv;
      systemName = "varjo.import";
      
      sourceProject = "${lisp-project_varjo}";
      patches = [];
      lisp_dependencies = "${lisp_varjo} ${lisp_glsl-toolkit} ${lisp_optima} ${lisp_fare-quasiquote-extras} ${lisp_rtg-math-vari}";
      name = "lisp_varjo-import-release-quicklisp-525a7693-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
