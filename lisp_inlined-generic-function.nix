
{ buildLispPackage, stdenv, fetchurl, lisp-project_inlined-generic-function, 
   lisp_introspect-environment, lisp_iterate, lisp_trivia,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_introspect-environment lisp_iterate lisp_trivia  ];
      inherit stdenv;
      systemName = "inlined-generic-function";
      
      sourceProject = "${lisp-project_inlined-generic-function}";
      patches = [];
      lisp_dependencies = "${lisp_introspect-environment} ${lisp_iterate} ${lisp_trivia}";
      name = "lisp_inlined-generic-function-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
