
{ buildLispPackage, stdenv, fetchurl, lisp-project_erudite, 
   lisp_erudite, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_erudite lisp_fiveam  ];
      inherit stdenv;
      systemName = "erudite-test";
      
      sourceProject = "${lisp-project_erudite}";
      patches = [];
      lisp_dependencies = "${lisp_erudite} ${lisp_fiveam}";
      name = "lisp_erudite-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
