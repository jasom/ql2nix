
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-viz, 
   lisp_cl-dot, lisp_iterate, lisp_trivia,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-dot lisp_iterate lisp_trivia  ];
      inherit stdenv;
      systemName = "asdf-viz";
      
      sourceProject = "${lisp-project_asdf-viz}";
      patches = [];
      lisp_dependencies = "${lisp_cl-dot} ${lisp_iterate} ${lisp_trivia}";
      name = "lisp_asdf-viz-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
