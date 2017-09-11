
{ buildLispPackage, stdenv, fetchurl, lisp-project_type-r, 
   lisp_alexandria, lisp_trivia,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_trivia  ];
      inherit stdenv;
      systemName = "type-r";
      
      sourceProject = "${lisp-project_type-r}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_trivia}";
      name = "lisp_type-r-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
