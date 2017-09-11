
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-escapes, 
   lisp_fiveam, lisp_trivial-escapes,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_trivial-escapes  ];
      inherit stdenv;
      systemName = "trivial-escapes-test";
      
      sourceProject = "${lisp-project_trivial-escapes}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_trivial-escapes}";
      name = "lisp_trivial-escapes-test-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
