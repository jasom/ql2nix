
{ buildLispPackage, stdenv, fetchurl, lisp-project_cells-gtk3, 
   lisp_cells-gtk, lisp_cl-glu, lisp_cl-glut, lisp_cl-opengl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cells-gtk lisp_cl-glu lisp_cl-glut lisp_cl-opengl  ];
      inherit stdenv;
      systemName = "test-gtk";
      
      sourceProject = "${lisp-project_cells-gtk3}";
      patches = [];
      lisp_dependencies = "${lisp_cells-gtk} ${lisp_cl-glu} ${lisp_cl-glut} ${lisp_cl-opengl}";
      name = "lisp_test-gtk-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
