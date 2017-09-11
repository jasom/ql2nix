
{ buildLispPackage, stdenv, fetchurl, lisp-project_legion, 
   lisp_legion, lisp_local-time, lisp_prove, lisp_prove-asdf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_legion lisp_local-time lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "legion-test";
      
      sourceProject = "${lisp-project_legion}";
      patches = [];
      lisp_dependencies = "${lisp_legion} ${lisp_local-time} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_legion-test-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
