
{ buildLispPackage, stdenv, fetchurl, lisp-project_let-over-lambda, 
   lisp_named-readtables, lisp_cl-ppcre, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables lisp_cl-ppcre lisp_alexandria  ];
      inherit stdenv;
      systemName = "let-over-lambda";
      
      sourceProject = "${lisp-project_let-over-lambda}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables} ${lisp_cl-ppcre} ${lisp_alexandria}";
      name = "lisp_let-over-lambda-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
