
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-trie, 
   lisp_fiveam,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-trie/tests";
      
      sourceProject = "${lisp-project_cl-trie}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam}";
      name = "lisp_cl-trie-tests-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
