
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-yaml, 
   lisp_alexandria, lisp_cl-fad, lisp_cl-yaml, lisp_fiveam, lisp_generic-comparability, lisp_trivial-benchmark, lisp_yason,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-fad lisp_cl-yaml lisp_fiveam lisp_generic-comparability lisp_trivial-benchmark lisp_yason  ];
      inherit stdenv;
      systemName = "cl-yaml-test";
      
      sourceProject = "${lisp-project_cl-yaml}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-fad} ${lisp_cl-yaml} ${lisp_fiveam} ${lisp_generic-comparability} ${lisp_trivial-benchmark} ${lisp_yason}";
      name = "lisp_cl-yaml-test-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
