
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hamcrest, 
   lisp_iterate, lisp_prove, lisp_hamcrest,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_prove lisp_hamcrest  ];
      inherit stdenv;
      systemName = "hamcrest-prove";
      
      sourceProject = "${lisp-project_cl-hamcrest}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_prove} ${lisp_hamcrest}";
      name = "lisp_hamcrest-prove-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
