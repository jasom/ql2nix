
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ssl, 
  openssl,   lisp_alexandria, lisp_bordeaux-threads, lisp_cffi, lisp_flexi-streams, lisp_trivial-features, lisp_trivial-garbage, lisp_trivial-gray-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_cffi lisp_flexi-streams lisp_trivial-features lisp_trivial-garbage lisp_trivial-gray-streams openssl ];
      inherit stdenv;
      systemName = "cl+ssl";
      
      sourceProject = "${lisp-project_cl-ssl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_flexi-streams} ${lisp_trivial-features} ${lisp_trivial-garbage} ${lisp_trivial-gray-streams}";
      name = "lisp_cl-ssl-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
