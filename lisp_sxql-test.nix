
{ buildLispPackage, stdenv, fetchurl, lisp-project_sxql, 
   lisp_prove, lisp_prove-asdf, lisp_sxql,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove lisp_prove-asdf lisp_sxql  ];
      inherit stdenv;
      systemName = "sxql-test";
      
      sourceProject = "${lisp-project_sxql}";
      patches = [];
      lisp_dependencies = "${lisp_prove} ${lisp_prove-asdf} ${lisp_sxql}";
      name = "lisp_sxql-test-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
