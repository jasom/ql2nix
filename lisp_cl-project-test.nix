
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-project, 
   lisp_caveman2, lisp_cl-project, lisp_prove, lisp_prove-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_caveman2 lisp_cl-project lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-project-test";
      
      sourceProject = "${lisp-project_cl-project}";
      patches = [];
      lisp_dependencies = "${lisp_caveman2} ${lisp_cl-project} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-project-test-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
