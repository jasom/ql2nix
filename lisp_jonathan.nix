
{ buildLispPackage, stdenv, fetchurl, lisp-project_jonathan, 
   lisp_cl-syntax, lisp_cl-syntax-annot, lisp_fast-io, lisp_proc-parse, lisp_cl-ppcre,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax lisp_cl-syntax-annot lisp_fast-io lisp_proc-parse lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "jonathan";
      
      sourceProject = "${lisp-project_jonathan}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax} ${lisp_cl-syntax-annot} ${lisp_fast-io} ${lisp_proc-parse} ${lisp_cl-ppcre}";
      name = "lisp_jonathan-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
