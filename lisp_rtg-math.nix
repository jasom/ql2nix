
{ buildLispPackage, stdenv, fetchurl, lisp-project_rtg-math, 
   lisp_alexandria, lisp_glsl-symbols,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_glsl-symbols  ];
      inherit stdenv;
      systemName = "rtg-math";
      
      sourceProject = "${lisp-project_rtg-math}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_glsl-symbols}";
      name = "lisp_rtg-math-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
