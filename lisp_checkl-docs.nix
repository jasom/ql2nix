
{ buildLispPackage, stdenv, fetchurl, lisp-project_checkl, 
   lisp_checkl, lisp_cl-gendoc,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_checkl lisp_cl-gendoc  ];
      inherit stdenv;
      systemName = "checkl-docs";
      
      sourceProject = "${lisp-project_checkl}";
      patches = [];
      lisp_dependencies = "${lisp_checkl} ${lisp_cl-gendoc}";
      name = "lisp_checkl-docs-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
