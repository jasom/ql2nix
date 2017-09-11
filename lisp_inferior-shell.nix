
{ buildLispPackage, stdenv, fetchurl, lisp-project_inferior-shell, 
   lisp_alexandria, lisp_fare-mop, lisp_fare-quasiquote-extras, lisp_fare-utils, lisp_optima,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_fare-mop lisp_fare-quasiquote-extras lisp_fare-utils lisp_optima  ];
      inherit stdenv;
      systemName = "inferior-shell";
      
      sourceProject = "${lisp-project_inferior-shell}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_fare-mop} ${lisp_fare-quasiquote-extras} ${lisp_fare-utils} ${lisp_optima}";
      name = "lisp_inferior-shell-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
