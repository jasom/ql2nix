
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-extract, 
   lisp_fiveam, lisp_trivial-extract,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_trivial-extract  ];
      inherit stdenv;
      systemName = "trivial-extract-test";
      
      sourceProject = "${lisp-project_trivial-extract}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_trivial-extract}";
      name = "lisp_trivial-extract-test-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
