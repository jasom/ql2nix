
{ buildLispPackage, stdenv, fetchurl, lisp-project_checkl, 
   lisp_marshal,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_marshal  ];
      inherit stdenv;
      systemName = "checkl";
      
      sourceProject = "${lisp-project_checkl}";
      patches = [];
      lisp_dependencies = "${lisp_marshal}";
      name = "lisp_checkl-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
