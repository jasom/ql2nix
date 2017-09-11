
{ buildLispPackage, stdenv, fetchurl, lisp-project_teepeedee2, 
  openssl,   lisp_alexandria, lisp_cffi, lisp_cl-cont, lisp_cl-fad, lisp_cl-irregsexp, lisp_iterate, lisp_parenscript, lisp_trivial-backtrace, lisp_trivial-garbage,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cl-cont lisp_cl-fad lisp_cl-irregsexp lisp_iterate lisp_parenscript lisp_trivial-backtrace lisp_trivial-garbage openssl ];
      inherit stdenv;
      systemName = "teepeedee2";
      
      sourceProject = "${lisp-project_teepeedee2}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cl-cont} ${lisp_cl-fad} ${lisp_cl-irregsexp} ${lisp_iterate} ${lisp_parenscript} ${lisp_trivial-backtrace} ${lisp_trivial-garbage}";
      name = "lisp_teepeedee2-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
