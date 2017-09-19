
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-conllu, 
   lisp_lispbuilder-lexer, lisp_yason, lisp_xmls, lisp_split-sequence, lisp_cl-log, lisp_alexandria, lisp_uuid, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lispbuilder-lexer lisp_yason lisp_xmls lisp_split-sequence lisp_cl-log lisp_alexandria lisp_uuid lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "cl-conllu";
      
      sourceProject = "${lisp-project_cl-conllu}";
      patches = [];
      lisp_dependencies = "${lisp_lispbuilder-lexer} ${lisp_yason} ${lisp_xmls} ${lisp_split-sequence} ${lisp_cl-log} ${lisp_alexandria} ${lisp_uuid} ${lisp_cl-ppcre}";
      name = "lisp_cl-conllu-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
