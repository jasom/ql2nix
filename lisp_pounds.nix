
{ buildLispPackage, stdenv, fetchurl, lisp-project_pounds, 
   lisp_bordeaux-threads, lisp_nibbles, lisp_trivial-gray-streams, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_nibbles lisp_trivial-gray-streams lisp_cffi  ];
      inherit stdenv;
      systemName = "pounds";
      
      sourceProject = "${lisp-project_pounds}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_nibbles} ${lisp_trivial-gray-streams} ${lisp_cffi}";
      name = "lisp_pounds-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
