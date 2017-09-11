
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-itertools, 
   lisp_alexandria, lisp_cl-coroutine, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-coroutine lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-itertools";
      
      sourceProject = "${lisp-project_cl-itertools}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-coroutine} ${lisp_iterate}";
      name = "lisp_cl-itertools-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
