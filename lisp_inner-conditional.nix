
{ buildLispPackage, stdenv, fetchurl, lisp-project_inner-conditional, 
   lisp_alexandria, lisp_cl-syntax-annot, lisp_iterate, lisp_optima,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-syntax-annot lisp_iterate lisp_optima  ];
      inherit stdenv;
      systemName = "inner-conditional";
      
      sourceProject = "${lisp-project_inner-conditional}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-syntax-annot} ${lisp_iterate} ${lisp_optima}";
      name = "lisp_inner-conditional-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
