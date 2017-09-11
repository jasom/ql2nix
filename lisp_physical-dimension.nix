
{ buildLispPackage, stdenv, fetchurl, lisp-project_antik, 
   lisp_fare-utils, lisp_foreign-array, lisp_trivial-utf-8,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-utils lisp_foreign-array lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "physical-dimension";
      
      sourceProject = "${lisp-project_antik}";
      patches = [];
      lisp_dependencies = "${lisp_fare-utils} ${lisp_foreign-array} ${lisp_trivial-utf-8}";
      name = "lisp_physical-dimension-master-ad6432e3-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
