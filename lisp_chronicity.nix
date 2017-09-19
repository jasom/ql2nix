
{ buildLispPackage, stdenv, fetchurl, lisp-project_chronicity, 
   lisp_local-time, lisp_cl-interpol, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_cl-interpol lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "chronicity";
      
      sourceProject = "${lisp-project_chronicity}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_cl-interpol} ${lisp_cl-ppcre}";
      name = "lisp_chronicity-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
