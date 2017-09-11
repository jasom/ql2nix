
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-lexer, 
   lisp_regex,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_regex  ];
      inherit stdenv;
      systemName = "lexer";
      
      sourceProject = "${lisp-project_cl-lexer}";
      patches = [];
      lisp_dependencies = "${lisp_regex}";
      name = "lisp_lexer-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
