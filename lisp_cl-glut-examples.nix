
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-opengl, 
  mesa, freeglut,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi mesa freeglut ];
      inherit stdenv;
      systemName = "cl-glut-examples";
      
      sourceProject = "${lisp-project_cl-opengl}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-glut-examples-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
