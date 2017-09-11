
{ buildLispPackage, stdenv, fetchurl, lisp-project_mexpr, 
   lisp_alexandria, lisp_cl-syntax,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-syntax  ];
      inherit stdenv;
      systemName = "mexpr";
      
      sourceProject = "${lisp-project_mexpr}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-syntax}";
      name = "lisp_mexpr-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
