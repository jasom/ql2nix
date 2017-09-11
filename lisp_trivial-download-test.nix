
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-download, 
   lisp_clack, lisp_clack-v1-compat, lisp_fiveam, lisp_trivial-download,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clack lisp_clack-v1-compat lisp_fiveam lisp_trivial-download  ];
      inherit stdenv;
      systemName = "trivial-download-test";
      
      sourceProject = "${lisp-project_trivial-download}";
      patches = [];
      lisp_dependencies = "${lisp_clack} ${lisp_clack-v1-compat} ${lisp_fiveam} ${lisp_trivial-download}";
      name = "lisp_trivial-download-test-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
