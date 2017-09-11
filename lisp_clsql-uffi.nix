
{ buildLispPackage, stdenv, fetchurl, lisp-project_clsql, 
   lisp_clsql, lisp_uffi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql lisp_uffi  ];
      inherit stdenv;
      systemName = "clsql-uffi";
      
      sourceProject = "${lisp-project_clsql}";
      patches = [];
      lisp_dependencies = "${lisp_clsql} ${lisp_uffi}";
      name = "lisp_clsql-uffi-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
