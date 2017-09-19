
{ buildLispPackage, stdenv, fetchurl, lisp-project_mito-auth, 
   lisp_babel, lisp_ironclad, lisp_mito,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_ironclad lisp_mito  ];
      inherit stdenv;
      systemName = "mito-auth";
      
      sourceProject = "${lisp-project_mito-auth}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_ironclad} ${lisp_mito}";
      name = "lisp_mito-auth-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
