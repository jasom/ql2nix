
{ buildLispPackage, stdenv, fetchurl, lisp-project_which, 
   lisp_fiveam, lisp_which,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_which  ];
      inherit stdenv;
      systemName = "which-test";
      
      sourceProject = "${lisp-project_which}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_which}";
      name = "lisp_which-test-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
