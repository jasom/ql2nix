
{ buildLispPackage, stdenv, fetchurl, lisp-project_fare-quasiquote, 
   lisp_fare-quasiquote-extras, lisp_hu-dwim-stefil,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-quasiquote-extras lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "fare-quasiquote-test";
      
      sourceProject = "${lisp-project_fare-quasiquote}";
      patches = [];
      lisp_dependencies = "${lisp_fare-quasiquote-extras} ${lisp_hu-dwim-stefil}";
      name = "lisp_fare-quasiquote-test-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
