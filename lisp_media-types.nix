
{ buildLispPackage, stdenv, fetchurl, lisp-project_media-types, 
   lisp_alexandria, lisp_serapeum, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_serapeum lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "media-types";
      
      sourceProject = "${lisp-project_media-types}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_serapeum} ${lisp_cl-ppcre}";
      name = "lisp_media-types-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
