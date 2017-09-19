
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cheshire-cat, 
   lisp_cl-store, lisp_hunchentoot, lisp_cl-ppcre,  
  clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-store lisp_hunchentoot lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "cl-cheshire-cat";
      
      sourceProject = "${lisp-project_cl-cheshire-cat}";
      patches = [];
      lisp_dependencies = "${lisp_cl-store} ${lisp_hunchentoot} ${lisp_cl-ppcre}";
      name = "lisp_cl-cheshire-cat-20121125-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
