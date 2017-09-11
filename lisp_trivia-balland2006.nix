
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia-balland2006, 
   lisp_alexandria, lisp_iterate, lisp_trivia, lisp_type-i,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_iterate lisp_trivia lisp_type-i  ];
      inherit stdenv;
      systemName = "trivia.balland2006";
      
      sourceProject = "${lisp-project_trivia-balland2006}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_iterate} ${lisp_trivia} ${lisp_type-i}";
      name = "lisp_trivia-balland2006-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
