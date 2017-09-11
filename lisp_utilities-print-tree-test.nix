
{ buildLispPackage, stdenv, fetchurl, lisp-project_utilities-print-tree, 
   lisp_alexandria, lisp_fiveam, lisp_utilities-print-tree,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_fiveam lisp_utilities-print-tree  ];
      inherit stdenv;
      systemName = "utilities.print-tree/test";
      
      sourceProject = "${lisp-project_utilities-print-tree}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_fiveam} ${lisp_utilities-print-tree}";
      name = "lisp_utilities-print-tree-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
