
{ buildLispPackage, stdenv, fetchurl, lisp-project_utilities-binary-dump, 
   lisp_alexandria, lisp_let-plus, lisp_nibbles,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_let-plus lisp_nibbles  ];
      inherit stdenv;
      systemName = "utilities.binary-dump";
      
      sourceProject = "${lisp-project_utilities-binary-dump}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_let-plus} ${lisp_nibbles}";
      name = "lisp_utilities-binary-dump-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
