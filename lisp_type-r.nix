
{ buildLispPackage, stdenv, fetchurl, lisp-project_type-r, 
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
      systemName = "type-r";
      
      sourceProject = "${lisp-project_type-r}";
      patches = [];
      lisp_dependencies = "${lisp_trivia}";
      name = "lisp_type-r-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
