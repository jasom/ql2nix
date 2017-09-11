
{ buildLispPackage, stdenv, fetchurl, lisp-project_dso-util, 
   lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "dso-util";
      
      sourceProject = "${lisp-project_dso-util}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre}";
      name = "lisp_dso-util-0.1.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }