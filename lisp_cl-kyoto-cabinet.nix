
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-kyoto-cabinet, 
  kyotocabinet,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi kyotocabinet ];
      inherit stdenv;
      systemName = "cl-kyoto-cabinet";
      
      sourceProject = "${lisp-project_cl-kyoto-cabinet}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-kyoto-cabinet-20120520-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
