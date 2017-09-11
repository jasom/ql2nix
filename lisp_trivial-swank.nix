
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-swank, 
   lisp_usocket, lisp_bordeaux-threads, lisp_verbose,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_bordeaux-threads lisp_verbose  ];
      inherit stdenv;
      systemName = "trivial-swank";
      
      sourceProject = "${lisp-project_trivial-swank}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_bordeaux-threads} ${lisp_verbose}";
      name = "lisp_trivial-swank-quicklisp-ab90d90f-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
