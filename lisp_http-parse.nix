
{ buildLispPackage, stdenv, fetchurl, lisp-project_http-parse, 
   lisp_babel, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "http-parse";
      
      sourceProject = "${lisp-project_http-parse}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-ppcre}";
      name = "lisp_http-parse-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
