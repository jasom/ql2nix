
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ssl, 
  openssl,   lisp_trivial-garbage, lisp_bordeaux-threads, lisp_flexi-streams, lisp_trivial-gray-streams, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_bordeaux-threads lisp_flexi-streams lisp_trivial-gray-streams lisp_cffi openssl ];
      inherit stdenv;
      systemName = "cl+ssl";
      
      sourceProject = "${lisp-project_cl-ssl}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_bordeaux-threads} ${lisp_flexi-streams} ${lisp_trivial-gray-streams} ${lisp_cffi}";
      name = "lisp_cl-ssl-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
