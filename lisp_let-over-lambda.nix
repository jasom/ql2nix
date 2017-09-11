
{ buildLispPackage, stdenv, fetchurl, lisp-project_let-over-lambda, 
   lisp_alexandria, lisp_cl-ppcre, lisp_named-readtables,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_named-readtables  ];
      inherit stdenv;
      systemName = "let-over-lambda";
      
      sourceProject = "${lisp-project_let-over-lambda}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_named-readtables}";
      name = "lisp_let-over-lambda-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
