
{ buildLispPackage, stdenv, fetchurl, lisp-project_croatoan, 
  ncurses,   lisp_trivial-gray-streams, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-gray-streams lisp_cffi ncurses ];
      inherit stdenv;
      systemName = "croatoan";
      
      sourceProject = "${lisp-project_croatoan}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams} ${lisp_cffi}";
      name = "lisp_croatoan-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
