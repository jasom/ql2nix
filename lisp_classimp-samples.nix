
{ buildLispPackage, stdenv, fetchurl, lisp-project_classimp, 
   lisp_classimp, lisp_sb-cga, lisp_cl-glut, lisp_cl-glu, lisp_cl-fad, lisp_cl-ilut,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_classimp lisp_sb-cga lisp_cl-glut lisp_cl-glu lisp_cl-fad lisp_cl-ilut  ];
      inherit stdenv;
      systemName = "classimp-samples";
      
      sourceProject = "${lisp-project_classimp}";
      patches = [];
      lisp_dependencies = "${lisp_classimp} ${lisp_sb-cga} ${lisp_cl-glut} ${lisp_cl-glu} ${lisp_cl-fad} ${lisp_cl-ilut}";
      name = "lisp_classimp-samples-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
