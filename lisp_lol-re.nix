
{ buildLispPackage, stdenv, fetchurl, lisp-project_lol-re, 
   lisp_named-readtables, lisp_cl-read-macro-tokens, lisp_cl-interpol, lisp_cl-ppcre,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables lisp_cl-read-macro-tokens lisp_cl-interpol lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "lol-re";
      
      sourceProject = "${lisp-project_lol-re}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables} ${lisp_cl-read-macro-tokens} ${lisp_cl-interpol} ${lisp_cl-ppcre}";
      name = "lisp_lol-re-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
