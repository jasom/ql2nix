
{ buildLispPackage, stdenv, fetchurl, lisp-project_croatoan, 
  ncurses,   lisp_cffi, lisp_trivial-gray-streams,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_trivial-gray-streams ncurses ];
      inherit stdenv;
      systemName = "croatoan";
      
      sourceProject = "${lisp-project_croatoan}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_trivial-gray-streams}";
      name = "lisp_croatoan-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
