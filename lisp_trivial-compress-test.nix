
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-compress, 
   lisp_fiveam, lisp_trivial-compress,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_trivial-compress  ];
      inherit stdenv;
      systemName = "trivial-compress-test";
      
      sourceProject = "${lisp-project_trivial-compress}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_trivial-compress}";
      name = "lisp_trivial-compress-test-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
