
{ buildLispPackage, stdenv, fetchurl, lisp-project_manardb, 
   lisp_cl-irregsexp, lisp_closer-mop, lisp_iterate, lisp_osicat, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-irregsexp lisp_closer-mop lisp_iterate lisp_osicat lisp_alexandria  ];
      inherit stdenv;
      systemName = "manardb";
      
      sourceProject = "${lisp-project_manardb}";
      patches = [];
      lisp_dependencies = "${lisp_cl-irregsexp} ${lisp_closer-mop} ${lisp_iterate} ${lisp_osicat} ${lisp_alexandria}";
      name = "lisp_manardb-20101207-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
