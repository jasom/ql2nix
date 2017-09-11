
{ buildLispPackage, stdenv, fetchurl, lisp-project_ratify, 
   lisp_cl-ppcre, lisp_local-time, lisp_parse-float,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_local-time lisp_parse-float  ];
      inherit stdenv;
      systemName = "ratify";
      
      sourceProject = "${lisp-project_ratify}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_local-time} ${lisp_parse-float}";
      name = "lisp_ratify-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
