
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-spark, 
   lisp_cl-spark, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-spark lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-spark-test";
      
      sourceProject = "${lisp-project_cl-spark}";
      patches = [];
      lisp_dependencies = "${lisp_cl-spark} ${lisp_fiveam}";
      name = "lisp_cl-spark-test-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
