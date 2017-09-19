
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sat, 
   lisp_iterate, lisp_trivia,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_trivia  ];
      inherit stdenv;
      systemName = "cl-sat";
      
      sourceProject = "${lisp-project_cl-sat}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_trivia}";
      name = "lisp_cl-sat-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
