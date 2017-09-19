
{ buildLispPackage, stdenv, fetchurl, lisp-project_overlord, 
   lisp_trivial-file-size, lisp_quri, lisp_s-base64, lisp_md5, lisp_fset, lisp_iterate, lisp_local-time, lisp_serapeum, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-file-size lisp_quri lisp_s-base64 lisp_md5 lisp_fset lisp_iterate lisp_local-time lisp_serapeum lisp_alexandria  ];
      inherit stdenv;
      systemName = "overlord";
      
      sourceProject = "${lisp-project_overlord}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-file-size} ${lisp_quri} ${lisp_s-base64} ${lisp_md5} ${lisp_fset} ${lisp_iterate} ${lisp_local-time} ${lisp_serapeum} ${lisp_alexandria}";
      name = "lisp_overlord-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
