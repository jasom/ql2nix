
{ buildLispPackage, stdenv, fetchurl, lisp-project_dso-lex, 
   lisp_cl-ppcre, lisp_dso-util,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_dso-util  ];
      inherit stdenv;
      systemName = "dso-lex";
      
      sourceProject = "${lisp-project_dso-lex}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_dso-util}";
      name = "lisp_dso-lex-0.3.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
