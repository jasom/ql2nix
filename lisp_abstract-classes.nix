
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-abstract-classes, 
   lisp_closer-mop,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop  ];
      inherit stdenv;
      systemName = "abstract-classes";
      
      sourceProject = "${lisp-project_cl-abstract-classes}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop}";
      name = "lisp_abstract-classes-20130128-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
