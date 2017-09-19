
{ buildLispPackage, stdenv, fetchurl, lisp-project_teepeedee2, 
  openssl,   lisp_parenscript, lisp_trivial-backtrace, lisp_cl-irregsexp, lisp_iterate, lisp_cffi, lisp_cl-cont, lisp_trivial-garbage, lisp_cl-fad,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parenscript lisp_trivial-backtrace lisp_cl-irregsexp lisp_iterate lisp_cffi lisp_cl-cont lisp_trivial-garbage lisp_cl-fad openssl ];
      inherit stdenv;
      systemName = "teepeedee2";
      
      sourceProject = "${lisp-project_teepeedee2}";
      patches = [];
      lisp_dependencies = "${lisp_parenscript} ${lisp_trivial-backtrace} ${lisp_cl-irregsexp} ${lisp_iterate} ${lisp_cffi} ${lisp_cl-cont} ${lisp_trivial-garbage} ${lisp_cl-fad}";
      name = "lisp_teepeedee2-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
