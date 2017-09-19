
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-libxml2, 
  libxml2,   lisp_metabang-bind, lisp_garbage-pools, lisp_flexi-streams, lisp_puri, lisp_iterate, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metabang-bind lisp_garbage-pools lisp_flexi-streams lisp_puri lisp_iterate lisp_cffi libxml2 ];
      inherit stdenv;
      systemName = "cl-libxml2";
      
      sourceProject = "${lisp-project_cl-libxml2}";
      patches = [];
      lisp_dependencies = "${lisp_metabang-bind} ${lisp_garbage-pools} ${lisp_flexi-streams} ${lisp_puri} ${lisp_iterate} ${lisp_cffi}";
      name = "lisp_cl-libxml2-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
