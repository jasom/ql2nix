
{ buildLispPackage, stdenv, fetchurl, lisp-project_parenml, 
   lisp_fiveam, lisp_parenml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_parenml  ];
      inherit stdenv;
      systemName = "parenml-test";
      
      sourceProject = "${lisp-project_parenml}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_parenml}";
      name = "lisp_parenml-test-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
