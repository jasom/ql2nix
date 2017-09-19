
{ buildLispPackage, stdenv, fetchurl, lisp-project_inferior-shell, 
   lisp_fare-mop, lisp_fare-quasiquote-extras, lisp_fare-utils, lisp_optima, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-mop lisp_fare-quasiquote-extras lisp_fare-utils lisp_optima lisp_alexandria  ];
      inherit stdenv;
      systemName = "inferior-shell";
      
      sourceProject = "${lisp-project_inferior-shell}";
      patches = [];
      lisp_dependencies = "${lisp_fare-mop} ${lisp_fare-quasiquote-extras} ${lisp_fare-utils} ${lisp_optima} ${lisp_alexandria}";
      name = "lisp_inferior-shell-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
