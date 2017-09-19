
{ buildLispPackage, stdenv, fetchurl, lisp-project_sxql, 
   lisp_split-sequence, lisp_cl-syntax-annot, lisp_iterate, lisp_optima,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_cl-syntax-annot lisp_iterate lisp_optima  ];
      inherit stdenv;
      systemName = "sxql";
      
      sourceProject = "${lisp-project_sxql}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_cl-syntax-annot} ${lisp_iterate} ${lisp_optima}";
      name = "lisp_sxql-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
