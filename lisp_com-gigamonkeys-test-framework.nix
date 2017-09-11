
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-test-framework, 
   lisp_com-gigamonkeys-macro-utilities,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-gigamonkeys-macro-utilities  ];
      inherit stdenv;
      systemName = "com.gigamonkeys.test-framework";
      
      sourceProject = "${lisp-project_monkeylib-test-framework}";
      patches = [];
      lisp_dependencies = "${lisp_com-gigamonkeys-macro-utilities}";
      name = "lisp_com-gigamonkeys-test-framework-20101207-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
