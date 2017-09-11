
{ buildLispPackage, stdenv, fetchurl, lisp-project_dynamic-classes, 
   lisp_metatilities-base,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metatilities-base  ];
      inherit stdenv;
      systemName = "dynamic-classes";
      
      sourceProject = "${lisp-project_dynamic-classes}";
      patches = [];
      lisp_dependencies = "${lisp_metatilities-base}";
      name = "lisp_dynamic-classes-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
