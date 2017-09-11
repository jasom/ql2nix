
{ buildLispPackage, stdenv, fetchurl, lisp-project_drakma, 
   lisp_drakma, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_fiveam  ];
      inherit stdenv;
      systemName = "drakma-test";
      
      sourceProject = "${lisp-project_drakma}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_fiveam}";
      name = "lisp_drakma-test-v2.0.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
