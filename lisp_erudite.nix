
{ buildLispPackage, stdenv, fetchurl, lisp-project_erudite, 
   lisp_log4cl, lisp_cl-template, lisp_split-sequence, lisp_cl-ppcre, lisp_cl-fad,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_log4cl lisp_cl-template lisp_split-sequence lisp_cl-ppcre lisp_cl-fad  ];
      inherit stdenv;
      systemName = "erudite";
      
      sourceProject = "${lisp-project_erudite}";
      patches = [];
      lisp_dependencies = "${lisp_log4cl} ${lisp_cl-template} ${lisp_split-sequence} ${lisp_cl-ppcre} ${lisp_cl-fad}";
      name = "lisp_erudite-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
