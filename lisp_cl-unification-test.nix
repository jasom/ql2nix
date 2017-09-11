
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-unification, 
   lisp_ptester,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ptester  ];
      inherit stdenv;
      systemName = "cl-unification-test";
      
      sourceProject = "${lisp-project_cl-unification}";
      patches = [];
      lisp_dependencies = "${lisp_ptester}";
      name = "lisp_cl-unification-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
