
{ buildLispPackage, stdenv, fetchurl, lisp-project_type-i, 
   lisp_fiveam, lisp_type-i,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_type-i  ];
      inherit stdenv;
      systemName = "type-i.test";
      
      sourceProject = "${lisp-project_type-i}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_type-i}";
      name = "lisp_type-i-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }