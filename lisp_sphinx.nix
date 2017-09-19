
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sphinx, 
   lisp_colorize, lisp_cl-fad, lisp_closure-template, lisp_docutils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_colorize lisp_cl-fad lisp_closure-template lisp_docutils  ];
      inherit stdenv;
      systemName = "sphinx";
      
      sourceProject = "${lisp-project_cl-sphinx}";
      patches = [];
      lisp_dependencies = "${lisp_colorize} ${lisp_cl-fad} ${lisp_closure-template} ${lisp_docutils}";
      name = "lisp_sphinx-20110619-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
