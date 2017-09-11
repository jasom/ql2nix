
{ buildLispPackage, stdenv, fetchurl, lisp-project_lquery, 
   lisp_lquery, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lquery lisp_fiveam  ];
      inherit stdenv;
      systemName = "lquery-test";
      
      sourceProject = "${lisp-project_lquery}";
      patches = [];
      lisp_dependencies = "${lisp_lquery} ${lisp_fiveam}";
      name = "lisp_lquery-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
