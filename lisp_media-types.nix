
{ buildLispPackage, stdenv, fetchurl, lisp-project_media-types, 
   lisp_cl-ppcre, lisp_serapeum, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_serapeum lisp_alexandria  ];
      inherit stdenv;
      systemName = "media-types";
      
      sourceProject = "${lisp-project_media-types}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_serapeum} ${lisp_alexandria}";
      name = "lisp_media-types-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
