
{ buildLispPackage, stdenv, fetchurl, lisp-project_dynamic-classes, 
   lisp_dynamic-classes, lisp_lift,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_dynamic-classes lisp_lift  ];
      inherit stdenv;
      systemName = "dynamic-classes-test";
      
      sourceProject = "${lisp-project_dynamic-classes}";
      patches = [];
      lisp_dependencies = "${lisp_dynamic-classes} ${lisp_lift}";
      name = "lisp_dynamic-classes-test-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
