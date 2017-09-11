
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-syntax, 
   lisp_named-readtables, lisp_trivial-types,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables lisp_trivial-types  ];
      inherit stdenv;
      systemName = "cl-syntax";
      
      sourceProject = "${lisp-project_cl-syntax}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables} ${lisp_trivial-types}";
      name = "lisp_cl-syntax-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
