
{ buildLispPackage, stdenv, fetchurl, lisp-project_proc-parse, 
   lisp_proc-parse, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_proc-parse lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "proc-parse-test";
      
      sourceProject = "${lisp-project_proc-parse}";
      patches = [];
      lisp_dependencies = "${lisp_proc-parse} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_proc-parse-test-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
