
{ buildLispPackage, stdenv, fetchurl, lisp-project_inlined-generic-function, 
   lisp_fiveam, lisp_inlined-generic-function,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_inlined-generic-function  ];
      inherit stdenv;
      systemName = "inlined-generic-function.test";
      
      sourceProject = "${lisp-project_inlined-generic-function}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_inlined-generic-function}";
      name = "lisp_inlined-generic-function-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
