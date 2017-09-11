
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-proj, 
  proj,   lisp_cffi, lisp_parse-number,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_parse-number proj ];
      inherit stdenv;
      systemName = "cl-proj";
      
      sourceProject = "${lisp-project_cl-proj}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_parse-number}";
      name = "lisp_cl-proj-20150804-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
