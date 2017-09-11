
{ buildLispPackage, stdenv, fetchurl, lisp-project_rtg-math, 
   lisp_glsl-symbols, lisp_rtg-math, lisp_varjo,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_glsl-symbols lisp_rtg-math lisp_varjo  ];
      inherit stdenv;
      systemName = "rtg-math.vari";
      
      sourceProject = "${lisp-project_rtg-math}";
      patches = [];
      lisp_dependencies = "${lisp_glsl-symbols} ${lisp_rtg-math} ${lisp_varjo}";
      name = "lisp_rtg-math-vari-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
