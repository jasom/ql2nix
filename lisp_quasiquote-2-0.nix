
{ buildLispPackage, stdenv, fetchurl, lisp-project_quasiquote-2-0, 
   lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate  ];
      inherit stdenv;
      systemName = "quasiquote-2.0";
      
      sourceProject = "${lisp-project_quasiquote-2-0}";
      patches = [];
      lisp_dependencies = "${lisp_iterate}";
      name = "lisp_quasiquote-2-0-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
