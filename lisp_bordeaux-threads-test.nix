
{ buildLispPackage, stdenv, fetchurl, lisp-project_bordeaux-threads, 
   lisp_bordeaux-threads, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_fiveam  ];
      inherit stdenv;
      systemName = "bordeaux-threads/test";
      
      sourceProject = "${lisp-project_bordeaux-threads}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_fiveam}";
      name = "lisp_bordeaux-threads-test-v0.8.5";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
