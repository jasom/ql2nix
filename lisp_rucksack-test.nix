
{ buildLispPackage, stdenv, fetchurl, lisp-project_rucksack, 
   lisp_rucksack,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rucksack  ];
      inherit stdenv;
      systemName = "rucksack-test";
      
      sourceProject = "${lisp-project_rucksack}";
      patches = [];
      lisp_dependencies = "${lisp_rucksack}";
      name = "lisp_rucksack-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
