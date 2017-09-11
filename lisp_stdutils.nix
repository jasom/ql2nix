
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-stdutils, 
   lisp_cl-fad, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "stdutils";
      
      sourceProject = "${lisp-project_cl-stdutils}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_cl-ppcre}";
      name = "lisp_stdutils-20111001-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
