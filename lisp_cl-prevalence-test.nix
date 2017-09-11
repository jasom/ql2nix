
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-prevalence, 
   lisp_cl-prevalence, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-prevalence lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-prevalence-test";
      
      sourceProject = "${lisp-project_cl-prevalence}";
      patches = [];
      lisp_dependencies = "${lisp_cl-prevalence} ${lisp_fiveam}";
      name = "lisp_cl-prevalence-test-20130720-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
