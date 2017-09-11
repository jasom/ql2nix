
{ buildLispPackage, stdenv, fetchurl, lisp-project_consix, 
   lisp_alexandria, lisp_cl-glu, lisp_cl-glut, lisp_cl-opengl,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-glu lisp_cl-glut lisp_cl-opengl  ];
      inherit stdenv;
      systemName = "consix";
      
      sourceProject = "${lisp-project_consix}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-glu} ${lisp_cl-glut} ${lisp_cl-opengl}";
      name = "lisp_consix-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
