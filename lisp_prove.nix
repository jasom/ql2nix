
{ buildLispPackage, stdenv, fetchurl, lisp-project_prove, 
   lisp_cl-ansi-text, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ansi-text lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "prove";
      
      sourceProject = "${lisp-project_prove}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ansi-text} ${lisp_cl-ppcre}";
      name = "lisp_prove-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
