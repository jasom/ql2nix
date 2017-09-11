
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-iterative, 
   lisp_cl-iterative, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-iterative lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-iterative-tests";
      
      sourceProject = "${lisp-project_cl-iterative}";
      patches = [];
      lisp_dependencies = "${lisp_cl-iterative} ${lisp_fiveam}";
      name = "lisp_cl-iterative-tests-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
