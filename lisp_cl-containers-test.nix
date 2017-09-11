
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-containers, 
   lisp_cl-containers, lisp_lift,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-containers lisp_lift  ];
      inherit stdenv;
      systemName = "cl-containers-test";
      
      sourceProject = "${lisp-project_cl-containers}";
      patches = [];
      lisp_dependencies = "${lisp_cl-containers} ${lisp_lift}";
      name = "lisp_cl-containers-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
