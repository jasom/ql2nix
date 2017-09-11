
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sentiment, 
   lisp_cl-ppcre, lisp_rt,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_rt  ];
      inherit stdenv;
      systemName = "cl-sentiment";
      
      sourceProject = "${lisp-project_cl-sentiment}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_rt}";
      name = "lisp_cl-sentiment-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
