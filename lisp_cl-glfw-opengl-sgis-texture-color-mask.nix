
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-glfw, 
   lisp_cl-glfw-opengl-core,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-glfw-opengl-core  ];
      inherit stdenv;
      systemName = "cl-glfw-opengl-sgis_texture_color_mask";
      
      sourceProject = "${lisp-project_cl-glfw}";
      patches = [];
      lisp_dependencies = "${lisp_cl-glfw-opengl-core}";
      name = "lisp_cl-glfw-opengl-sgis-texture-color-mask-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
