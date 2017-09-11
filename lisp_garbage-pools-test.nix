
{ buildLispPackage, stdenv, fetchurl, lisp-project_garbage-pools, 
   lisp_garbage-pools, lisp_lift,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_garbage-pools lisp_lift  ];
      inherit stdenv;
      systemName = "garbage-pools-test";
      
      sourceProject = "${lisp-project_garbage-pools}";
      patches = [];
      lisp_dependencies = "${lisp_garbage-pools} ${lisp_lift}";
      name = "lisp_garbage-pools-test-20130720-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
