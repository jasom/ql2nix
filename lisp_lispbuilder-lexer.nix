
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
   lisp_lispbuilder-regex,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lispbuilder-regex  ];
      inherit stdenv;
      systemName = "lispbuilder-lexer";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_lispbuilder-regex}";
      name = "lisp_lispbuilder-lexer-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
