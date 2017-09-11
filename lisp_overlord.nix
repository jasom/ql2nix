
{ buildLispPackage, stdenv, fetchurl, lisp-project_overlord, 
   lisp_asdf-package-system, lisp_alexandria, lisp_serapeum, lisp_local-time, lisp_iterate, lisp_md5, lisp_s-base64, lisp_quri, lisp_cl-custom-hash-table,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-package-system lisp_alexandria lisp_serapeum lisp_local-time lisp_iterate lisp_md5 lisp_s-base64 lisp_quri lisp_cl-custom-hash-table  ];
      inherit stdenv;
      systemName = "overlord";
      
      sourceProject = "${lisp-project_overlord}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-package-system} ${lisp_alexandria} ${lisp_serapeum} ${lisp_local-time} ${lisp_iterate} ${lisp_md5} ${lisp_s-base64} ${lisp_quri} ${lisp_cl-custom-hash-table}";
      name = "lisp_overlord-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
