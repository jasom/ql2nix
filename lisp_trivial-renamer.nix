
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-renamer, 
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
      systemName = "trivial-renamer";
      
      sourceProject = "${lisp-project_trivial-renamer}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre}";
      name = "lisp_trivial-renamer-quicklisp-1282597d-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
