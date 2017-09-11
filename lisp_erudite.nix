
{ buildLispPackage, stdenv, fetchurl, lisp-project_erudite, 
   lisp_cl-fad, lisp_cl-ppcre, lisp_split-sequence, lisp_cl-template, lisp_log4cl,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_cl-ppcre lisp_split-sequence lisp_cl-template lisp_log4cl  ];
      inherit stdenv;
      systemName = "erudite";
      
      sourceProject = "${lisp-project_erudite}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_split-sequence} ${lisp_cl-template} ${lisp_log4cl}";
      name = "lisp_erudite-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
