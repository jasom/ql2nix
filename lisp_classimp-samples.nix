
{ buildLispPackage, stdenv, fetchurl, lisp-project_classimp, 
  assimp,   lisp_cl-ilut, lisp_cl-fad, lisp_cl-glut, lisp_sb-cga, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ilut lisp_cl-fad lisp_cl-glut lisp_sb-cga lisp_cffi assimp ];
      inherit stdenv;
      systemName = "classimp-samples";
      
      sourceProject = "${lisp-project_classimp}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ilut} ${lisp_cl-fad} ${lisp_cl-glut} ${lisp_sb-cga} ${lisp_cffi}";
      name = "lisp_classimp-samples-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
