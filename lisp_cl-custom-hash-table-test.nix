
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-custom-hash-table, 
   lisp_hu-dwim-stefil,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "cl-custom-hash-table-test";
      
      sourceProject = "${lisp-project_cl-custom-hash-table}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-stefil}";
      name = "lisp_cl-custom-hash-table-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
