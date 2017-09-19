
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rrt, 
   lisp_anaphora, lisp_cl-syntax-annot, lisp_alexandria, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_cl-syntax-annot lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-rrt";
      
      sourceProject = "${lisp-project_cl-rrt}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_cl-syntax-annot} ${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_cl-rrt-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
