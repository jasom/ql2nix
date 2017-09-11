
{ buildLispPackage, stdenv, fetchurl, lisp-project_introspect-environment, 
   lisp_fiveam, lisp_introspect-environment,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_introspect-environment  ];
      inherit stdenv;
      systemName = "introspect-environment-test";
      
      sourceProject = "${lisp-project_introspect-environment}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_introspect-environment}";
      name = "lisp_introspect-environment-test-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
