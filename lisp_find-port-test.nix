
{ buildLispPackage, stdenv, fetchurl, lisp-project_find-port, 
   lisp_find-port, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_find-port lisp_fiveam  ];
      inherit stdenv;
      systemName = "find-port-test";
      
      sourceProject = "${lisp-project_find-port}";
      patches = [];
      lisp_dependencies = "${lisp_find-port} ${lisp_fiveam}";
      name = "lisp_find-port-test-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
