
{ buildLispPackage, stdenv, fetchurl, lisp-project_consix, 
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
      systemName = "consix";
      
      sourceProject = "${lisp-project_consix}";
      patches = [];
      lisp_dependencies = "${lisp_cl-glu} ${lisp_cl-opengl} ${lisp_alexandria}";
      name = "lisp_consix-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
