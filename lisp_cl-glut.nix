
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-opengl, 
  freeglut,   lisp_alexandria, lisp_cffi, lisp_cl-opengl,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cl-opengl freeglut ];
      inherit stdenv;
      systemName = "cl-glut";
      
      sourceProject = "${lisp-project_cl-opengl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cl-opengl}";
      name = "lisp_cl-glut-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }