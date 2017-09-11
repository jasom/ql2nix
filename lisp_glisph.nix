
{ buildLispPackage, stdenv, fetchurl, lisp-project_glisph, 
   lisp_cl-annot, lisp_cl-glu, lisp_cl-opengl, lisp_cl-reexport, lisp_zpb-ttf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-annot lisp_cl-glu lisp_cl-opengl lisp_cl-reexport lisp_zpb-ttf  ];
      inherit stdenv;
      systemName = "glisph";
      
      sourceProject = "${lisp-project_glisph}";
      patches = [];
      lisp_dependencies = "${lisp_cl-annot} ${lisp_cl-glu} ${lisp_cl-opengl} ${lisp_cl-reexport} ${lisp_zpb-ttf}";
      name = "lisp_glisph-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
