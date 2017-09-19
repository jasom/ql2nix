
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-dropbox, 
   lisp_cl-oauth, lisp_cl-json, lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-oauth lisp_cl-json lisp_drakma  ];
      inherit stdenv;
      systemName = "cl-dropbox";
      
      sourceProject = "${lisp-project_cl-dropbox}";
      patches = [];
      lisp_dependencies = "${lisp_cl-oauth} ${lisp_cl-json} ${lisp_drakma}";
      name = "lisp_cl-dropbox-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
