
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-glfw, 
  mesa,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi mesa ];
      inherit stdenv;
      systemName = "cl-glfw-opengl-arb_draw_elements_base_vertex";
      
      sourceProject = "${lisp-project_cl-glfw}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-glfw-opengl-arb-draw-elements-base-vertex-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }