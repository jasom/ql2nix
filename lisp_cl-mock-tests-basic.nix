
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mock, 
   lisp_cl-mock-basic, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-mock-basic lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-mock-tests-basic";
      
      sourceProject = "${lisp-project_cl-mock}";
      patches = [];
      lisp_dependencies = "${lisp_cl-mock-basic} ${lisp_fiveam}";
      name = "lisp_cl-mock-tests-basic-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
