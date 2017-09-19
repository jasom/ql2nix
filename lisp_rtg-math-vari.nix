
{ buildLispPackage, stdenv, fetchurl, lisp-project_rtg-math, 
   lisp_varjo, lisp_glsl-symbols,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_varjo lisp_glsl-symbols  ];
      inherit stdenv;
      systemName = "rtg-math.vari";
      
      sourceProject = "${lisp-project_rtg-math}";
      patches = [];
      lisp_dependencies = "${lisp_varjo} ${lisp_glsl-symbols}";
      name = "lisp_rtg-math-vari-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
