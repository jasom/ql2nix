
{ buildLispPackage, stdenv, fetchurl, lisp-project_glisph, 
   lisp_cl-glut, lisp_glisph, lisp_prove, lisp_prove-asdf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-glut lisp_glisph lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "glisph-test";
      
      sourceProject = "${lisp-project_glisph}";
      patches = [];
      lisp_dependencies = "${lisp_cl-glut} ${lisp_glisph} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_glisph-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
