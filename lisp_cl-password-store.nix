
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-password-store, 
   lisp_clsql, lisp_ironclad,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql lisp_ironclad  ];
      inherit stdenv;
      systemName = "cl-password-store";
      
      sourceProject = "${lisp-project_cl-password-store}";
      patches = [];
      lisp_dependencies = "${lisp_clsql} ${lisp_ironclad}";
      name = "lisp_cl-password-store-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
