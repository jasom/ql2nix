
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-debug-console, 
   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi  ];
      inherit stdenv;
      systemName = "trivial-debug-console";
      
      sourceProject = "${lisp-project_trivial-debug-console}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_trivial-debug-console-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
