
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-devil, 
   lisp_alexandria, lisp_cffi, lisp_cl-devil,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cl-devil  ];
      inherit stdenv;
      systemName = "cl-ilut";
      
      sourceProject = "${lisp-project_cl-devil}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cl-devil}";
      name = "lisp_cl-ilut-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
