
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-opengl, 
  mesa, freeglut,   lisp_cffi, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_alexandria mesa freeglut ];
      inherit stdenv;
      systemName = "cl-glut";
      
      sourceProject = "${lisp-project_cl-opengl}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_alexandria}";
      name = "lisp_cl-glut-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
