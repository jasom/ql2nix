
{ buildLispPackage, stdenv, fetchurl, lisp-project_graylex, 
   lisp_alexandria, lisp_trivial-gray-streams, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_trivial-gray-streams lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "graylex";
      
      sourceProject = "${lisp-project_graylex}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_trivial-gray-streams} ${lisp_cl-ppcre}";
      name = "lisp_graylex-20110522-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
