
{ buildLispPackage, stdenv, fetchurl, lisp-project_towers, 
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
      systemName = "towers";
      
      sourceProject = "${lisp-project_towers}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-glu} ${lisp_cl-glut} ${lisp_cl-opengl}";
      name = "lisp_towers-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
