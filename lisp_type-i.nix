
{ buildLispPackage, stdenv, fetchurl, lisp-project_type-i, 
   lisp_alexandria, lisp_introspect-environment, lisp_lisp-namespace, lisp_trivia,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_introspect-environment lisp_lisp-namespace lisp_trivia  ];
      inherit stdenv;
      systemName = "type-i";
      
      sourceProject = "${lisp-project_type-i}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_introspect-environment} ${lisp_lisp-namespace} ${lisp_trivia}";
      name = "lisp_type-i-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
