
{ buildLispPackage, stdenv, fetchurl, lisp-project_bit-ops, 
   lisp_bit-ops, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bit-ops lisp_fiveam  ];
      inherit stdenv;
      systemName = "bit-ops.test";
      
      sourceProject = "${lisp-project_bit-ops}";
      patches = [];
      lisp_dependencies = "${lisp_bit-ops} ${lisp_fiveam}";
      name = "lisp_bit-ops-test-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
