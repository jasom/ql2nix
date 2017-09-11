
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_clack-v1-compat, lisp_rucksack,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clack-v1-compat lisp_rucksack  ];
      inherit stdenv;
      systemName = "clack-middleware-rucksack";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_clack-v1-compat} ${lisp_rucksack}";
      name = "lisp_clack-middleware-rucksack-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
