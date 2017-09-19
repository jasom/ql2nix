
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-unicode, 
   lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "cl-unicode";
      
      sourceProject = "${lisp-project_cl-unicode}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre}";
      name = "lisp_cl-unicode-0.1.5";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
