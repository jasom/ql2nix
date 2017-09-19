
{ buildLispPackage, stdenv, fetchurl, lisp-project_dso-lex, 
   lisp_dso-util, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_dso-util lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "dso-lex";
      
      sourceProject = "${lisp-project_dso-lex}";
      patches = [];
      lisp_dependencies = "${lisp_dso-util} ${lisp_cl-ppcre}";
      name = "lisp_dso-lex-0.3.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
