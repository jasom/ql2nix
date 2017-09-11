
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-libxml2, 
  libxml2,   lisp_alexandria, lisp_cffi, lisp_flexi-streams, lisp_garbage-pools, lisp_iterate, lisp_metabang-bind, lisp_puri,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_flexi-streams lisp_garbage-pools lisp_iterate lisp_metabang-bind lisp_puri libxml2 ];
      inherit stdenv;
      systemName = "cl-libxml2";
      
      sourceProject = "${lisp-project_cl-libxml2}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_flexi-streams} ${lisp_garbage-pools} ${lisp_iterate} ${lisp_metabang-bind} ${lisp_puri}";
      name = "lisp_cl-libxml2-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
