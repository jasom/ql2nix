
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-permutation, 
   lisp_closer-mop, lisp_cl-algebraic-data-type, lisp_iterate, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_cl-algebraic-data-type lisp_iterate lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-permutation-examples";
      
      sourceProject = "${lisp-project_cl-permutation}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_cl-algebraic-data-type} ${lisp_iterate} ${lisp_alexandria}";
      name = "lisp_cl-permutation-examples-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
