
{ buildLispPackage, stdenv, fetchurl, lisp-project_towers, 
  freeglut,   lisp_cl-glu, lisp_cl-opengl, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-glu lisp_cl-opengl lisp_alexandria freeglut ];
      inherit stdenv;
      systemName = "towers";
      
      sourceProject = "${lisp-project_towers}";
      patches = [];
      lisp_dependencies = "${lisp_cl-glu} ${lisp_cl-opengl} ${lisp_alexandria}";
      name = "lisp_towers-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
