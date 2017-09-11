
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_alexandria, lisp_iterate, lisp_clml-utility, lisp_introspect-environment,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_iterate lisp_clml-utility lisp_introspect-environment  ];
      inherit stdenv;
      systemName = "clml.hjs";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_iterate} ${lisp_clml-utility} ${lisp_introspect-environment}";
      name = "lisp_clml-hjs-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
