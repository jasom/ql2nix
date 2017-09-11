
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-hooks, 
   lisp_cl-hooks, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-hooks lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-hooks/test";
      
      sourceProject = "${lisp-project_architecture-hooks}";
      patches = [];
      lisp_dependencies = "${lisp_cl-hooks} ${lisp_fiveam}";
      name = "lisp_cl-hooks-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
