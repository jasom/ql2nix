
{ buildLispPackage, stdenv, fetchurl, lisp-project_pounds, 
   lisp_babel, lisp_bordeaux-threads, lisp_cffi, lisp_nibbles, lisp_trivial-gray-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_bordeaux-threads lisp_cffi lisp_nibbles lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "pounds";
      
      sourceProject = "${lisp-project_pounds}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_nibbles} ${lisp_trivial-gray-streams}";
      name = "lisp_pounds-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
