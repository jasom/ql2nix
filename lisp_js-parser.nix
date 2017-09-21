
{ buildLispPackage, stdenv, fetchurl, lisp-project_js-parser, 
   lisp_cl-ppcre,  
  clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "js-parser";
      
      sourceProject = "${lisp-project_js-parser}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre}";
      name = "lisp_js-parser-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }