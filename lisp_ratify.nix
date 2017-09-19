
{ buildLispPackage, stdenv, fetchurl, lisp-project_ratify, 
   lisp_parse-float, lisp_local-time, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-float lisp_local-time lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "ratify";
      
      sourceProject = "${lisp-project_ratify}";
      patches = [];
      lisp_dependencies = "${lisp_parse-float} ${lisp_local-time} ${lisp_cl-ppcre}";
      name = "lisp_ratify-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
