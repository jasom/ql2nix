
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia-balland2006, 
   lisp_iterate, lisp_type-i, lisp_trivia,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_type-i lisp_trivia  ];
      inherit stdenv;
      systemName = "trivia.balland2006.enabled";
      
      sourceProject = "${lisp-project_trivia-balland2006}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_type-i} ${lisp_trivia}";
      name = "lisp_trivia-balland2006-enabled-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
