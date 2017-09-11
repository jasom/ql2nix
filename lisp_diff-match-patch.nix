
{ buildLispPackage, stdenv, fetchurl, lisp-project_diff-match-patch, 
   lisp_cl-ppcre, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_iterate  ];
      inherit stdenv;
      systemName = "diff-match-patch";
      
      sourceProject = "${lisp-project_diff-match-patch}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_iterate}";
      name = "lisp_diff-match-patch-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
