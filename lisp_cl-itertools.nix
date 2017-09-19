
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-itertools, 
   lisp_iterate, lisp_cl-coroutine,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_cl-coroutine  ];
      inherit stdenv;
      systemName = "cl-itertools";
      
      sourceProject = "${lisp-project_cl-itertools}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_cl-coroutine}";
      name = "lisp_cl-itertools-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
