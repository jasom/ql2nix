
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-opengl, 
   lisp_cffi, lisp_cl-glu, lisp_cl-glut, lisp_cl-opengl,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-glu lisp_cl-glut lisp_cl-opengl  ];
      inherit stdenv;
      systemName = "cl-glut-examples";
      
      sourceProject = "${lisp-project_cl-opengl}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-glu} ${lisp_cl-glut} ${lisp_cl-opengl}";
      name = "lisp_cl-glut-examples-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
