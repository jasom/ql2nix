
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-glfw, 
  glfw,   lisp_cffi, lisp_cl-glfw-types,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-glfw-types glfw ];
      inherit stdenv;
      systemName = "cl-glfw";
      
      sourceProject = "${lisp-project_cl-glfw}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-glfw-types}";
      name = "lisp_cl-glfw-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
