
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-log, 
   lisp_cl-log, lisp_eos,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-log lisp_eos  ];
      inherit stdenv;
      systemName = "cl-log-test";
      
      sourceProject = "${lisp-project_cl-log}";
      patches = [];
      lisp_dependencies = "${lisp_cl-log} ${lisp_eos}";
      name = "lisp_cl-log-test.1.0.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
