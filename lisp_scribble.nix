
{ buildLispPackage, stdenv, fetchurl, lisp-project_scribble, 
   lisp_fare-quasiquote-readtable, lisp_fare-memoization, lisp_fare-utils, lisp_meta,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-quasiquote-readtable lisp_fare-memoization lisp_fare-utils lisp_meta  ];
      inherit stdenv;
      systemName = "scribble";
      
      sourceProject = "${lisp-project_scribble}";
      patches = [];
      lisp_dependencies = "${lisp_fare-quasiquote-readtable} ${lisp_fare-memoization} ${lisp_fare-utils} ${lisp_meta}";
      name = "lisp_scribble-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
