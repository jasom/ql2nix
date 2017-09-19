
{ buildLispPackage, stdenv, fetchurl, lisp-project_roan, 
   lisp_trivial-documentation, lisp_zip, lisp_drakma, lisp_sqlite, lisp_cl-fad, lisp_s-base64, lisp_cl-ppcre, lisp_trivial-garbage, lisp_iterate, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-documentation lisp_zip lisp_drakma lisp_sqlite lisp_cl-fad lisp_s-base64 lisp_cl-ppcre lisp_trivial-garbage lisp_iterate lisp_alexandria  ];
      inherit stdenv;
      systemName = "roan/doc";
      
      sourceProject = "${lisp-project_roan}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-documentation} ${lisp_zip} ${lisp_drakma} ${lisp_sqlite} ${lisp_cl-fad} ${lisp_s-base64} ${lisp_cl-ppcre} ${lisp_trivial-garbage} ${lisp_iterate} ${lisp_alexandria}";
      name = "lisp_roan-doc-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
