
{ buildLispPackage, stdenv, fetchurl, lisp-project_treedb, 
   lisp_fiveam, lisp_treedb,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_treedb  ];
      inherit stdenv;
      systemName = "treedb.tests";
      
      sourceProject = "${lisp-project_treedb}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_treedb}";
      name = "lisp_treedb-tests-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
