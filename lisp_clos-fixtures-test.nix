
{ buildLispPackage, stdenv, fetchurl, lisp-project_clos-fixtures, 
   lisp_clos-fixtures, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clos-fixtures lisp_fiveam  ];
      inherit stdenv;
      systemName = "clos-fixtures-test";
      
      sourceProject = "${lisp-project_clos-fixtures}";
      patches = [];
      lisp_dependencies = "${lisp_clos-fixtures} ${lisp_fiveam}";
      name = "lisp_clos-fixtures-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
