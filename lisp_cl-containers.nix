
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-containers, 
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
      systemName = "cl-containers";
      
      sourceProject = "${lisp-project_cl-containers}";
      patches = [];
      lisp_dependencies = "${lisp_metatilities-base}";
      name = "lisp_cl-containers-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }