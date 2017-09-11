
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-shell, 
   lisp_lift,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift  ];
      inherit stdenv;
      systemName = "trivial-shell-test";
      
      sourceProject = "${lisp-project_trivial-shell}";
      patches = [];
      lisp_dependencies = "${lisp_lift}";
      name = "lisp_trivial-shell-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
