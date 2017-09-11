
{ buildLispPackage, stdenv, fetchurl, lisp-project_crane, 
   lisp_crane, lisp_fiveam,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_crane lisp_fiveam  ];
      inherit stdenv;
      systemName = "crane-test";
      
      sourceProject = "${lisp-project_crane}";
      patches = [];
      lisp_dependencies = "${lisp_crane} ${lisp_fiveam}";
      name = "lisp_crane-test-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
