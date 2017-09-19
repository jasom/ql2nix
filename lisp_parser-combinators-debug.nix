
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-parser-combinators, 
   lisp_cl-containers, lisp_alexandria, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-containers lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "parser-combinators-debug";
      
      sourceProject = "${lisp-project_cl-parser-combinators}";
      patches = [];
      lisp_dependencies = "${lisp_cl-containers} ${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_parser-combinators-debug-20131111-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
