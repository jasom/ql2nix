
{ buildLispPackage, stdenv, fetchurl, lisp-project_cletris, 
   lisp_cletris, lisp_prove, lisp_prove-asdf,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cletris lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cletris-test";
      
      sourceProject = "${lisp-project_cletris}";
      patches = [];
      lisp_dependencies = "${lisp_cletris} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cletris-test-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
