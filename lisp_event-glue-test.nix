
{ buildLispPackage, stdenv, fetchurl, lisp-project_event-glue, 
   lisp_event-glue, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_event-glue lisp_fiveam  ];
      inherit stdenv;
      systemName = "event-glue-test";
      
      sourceProject = "${lisp-project_event-glue}";
      patches = [];
      lisp_dependencies = "${lisp_event-glue} ${lisp_fiveam}";
      name = "lisp_event-glue-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
