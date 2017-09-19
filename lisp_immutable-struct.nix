
{ buildLispPackage, stdenv, fetchurl, lisp-project_immutable-struct, 
   lisp_trivia,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivia  ];
      inherit stdenv;
      systemName = "immutable-struct";
      
      sourceProject = "${lisp-project_immutable-struct}";
      patches = [];
      lisp_dependencies = "${lisp_trivia}";
      name = "lisp_immutable-struct-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
