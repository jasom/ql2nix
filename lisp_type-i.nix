
{ buildLispPackage, stdenv, fetchurl, lisp-project_type-i, 
   lisp_trivia, lisp_alexandria, lisp_introspect-environment,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivia lisp_alexandria lisp_introspect-environment  ];
      inherit stdenv;
      systemName = "type-i";
      
      sourceProject = "${lisp-project_type-i}";
      patches = [];
      lisp_dependencies = "${lisp_trivia} ${lisp_alexandria} ${lisp_introspect-environment}";
      name = "lisp_type-i-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
