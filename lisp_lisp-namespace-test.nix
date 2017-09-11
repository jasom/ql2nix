
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-namespace, 
   lisp_lisp-namespace, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lisp-namespace lisp_fiveam  ];
      inherit stdenv;
      systemName = "lisp-namespace.test";
      
      sourceProject = "${lisp-project_lisp-namespace}";
      patches = [];
      lisp_dependencies = "${lisp_lisp-namespace} ${lisp_fiveam}";
      name = "lisp_lisp-namespace-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
