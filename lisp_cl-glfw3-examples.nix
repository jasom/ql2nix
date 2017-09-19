
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-glfw3, 
  glfw,   lisp_trivial-main-thread, lisp_cl-opengl, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-main-thread lisp_cl-opengl lisp_cffi glfw ];
      inherit stdenv;
      systemName = "cl-glfw3-examples";
      
      sourceProject = "${lisp-project_cl-glfw3}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-main-thread} ${lisp_cl-opengl} ${lisp_cffi}";
      name = "lisp_cl-glfw3-examples-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
