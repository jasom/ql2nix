
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-project, 
   lisp_alexandria, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "trivial-project";
      
      sourceProject = "${lisp-project_trivial-project}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre}";
      name = "lisp_trivial-project-quicklisp-9e3fe231-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
