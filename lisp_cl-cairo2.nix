
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cairo2, 
  cairo,   lisp_cffi, lisp_cl-colors, lisp_cl-utilities, lisp_metabang-bind, lisp_trivial-features, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-colors lisp_cl-utilities lisp_metabang-bind lisp_trivial-features lisp_trivial-garbage cairo ];
      inherit stdenv;
      systemName = "cl-cairo2";
      
      sourceProject = "${lisp-project_cl-cairo2}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-colors} ${lisp_cl-utilities} ${lisp_metabang-bind} ${lisp_trivial-features} ${lisp_trivial-garbage}";
      name = "lisp_cl-cairo2-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
