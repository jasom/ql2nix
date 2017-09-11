
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-marklogic, 
   lisp_cl-marklogic, lisp_fiveam, lisp_ml-optimizer,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-marklogic lisp_fiveam lisp_ml-optimizer  ];
      inherit stdenv;
      systemName = "ml-test";
      
      sourceProject = "${lisp-project_cl-marklogic}";
      patches = [];
      lisp_dependencies = "${lisp_cl-marklogic} ${lisp_fiveam} ${lisp_ml-optimizer}";
      name = "lisp_ml-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
