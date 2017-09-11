
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-parser-combinators, 
   lisp_cl-containers, lisp_parser-combinators,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-containers lisp_parser-combinators  ];
      inherit stdenv;
      systemName = "parser-combinators-debug";
      
      sourceProject = "${lisp-project_cl-parser-combinators}";
      patches = [];
      lisp_dependencies = "${lisp_cl-containers} ${lisp_parser-combinators}";
      name = "lisp_parser-combinators-debug-20131111-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
