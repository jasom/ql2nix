
{ buildLispPackage, stdenv, fetchurl, lisp-project_transparent-wrap, 
   lisp_fare-quasiquote-extras, lisp_named-readtables, lisp_optima, lisp_trivial-arguments,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-quasiquote-extras lisp_named-readtables lisp_optima lisp_trivial-arguments  ];
      inherit stdenv;
      systemName = "transparent-wrap";
      
      sourceProject = "${lisp-project_transparent-wrap}";
      patches = [];
      lisp_dependencies = "${lisp_fare-quasiquote-extras} ${lisp_named-readtables} ${lisp_optima} ${lisp_trivial-arguments}";
      name = "lisp_transparent-wrap-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
