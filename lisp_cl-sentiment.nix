
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sentiment, 
   lisp_rt, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rt lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "cl-sentiment";
      
      sourceProject = "${lisp-project_cl-sentiment}";
      patches = [];
      lisp_dependencies = "${lisp_rt} ${lisp_cl-ppcre}";
      name = "lisp_cl-sentiment-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
