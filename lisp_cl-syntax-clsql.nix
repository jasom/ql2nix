
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-syntax, 
   lisp_cl-syntax, lisp_clsql,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax lisp_clsql  ];
      inherit stdenv;
      systemName = "cl-syntax-clsql";
      
      sourceProject = "${lisp-project_cl-syntax}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax} ${lisp_clsql}";
      name = "lisp_cl-syntax-clsql-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
