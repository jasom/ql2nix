
{ buildLispPackage, stdenv, fetchurl, lisp-project_clsql, 
   lisp_uffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_uffi  ];
      inherit stdenv;
      systemName = "clsql";
      
      sourceProject = "${lisp-project_clsql}";
      patches = [];
      lisp_dependencies = "${lisp_uffi}";
      name = "lisp_clsql-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
