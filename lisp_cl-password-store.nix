
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-password-store, 
   lisp_ironclad, lisp_clsql,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_clsql  ];
      inherit stdenv;
      systemName = "cl-password-store";
      
      sourceProject = "${lisp-project_cl-password-store}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_clsql}";
      name = "lisp_cl-password-store-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
