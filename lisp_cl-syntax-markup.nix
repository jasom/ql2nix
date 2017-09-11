
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-syntax, 
   lisp_cl-markup, lisp_cl-syntax,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-markup lisp_cl-syntax  ];
      inherit stdenv;
      systemName = "cl-syntax-markup";
      
      sourceProject = "${lisp-project_cl-syntax}";
      patches = [];
      lisp_dependencies = "${lisp_cl-markup} ${lisp_cl-syntax}";
      name = "lisp_cl-syntax-markup-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
