
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl4store, 
   lisp_parser-combinators, lisp_log5, lisp_cl-rdfxml, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parser-combinators lisp_log5 lisp_cl-rdfxml lisp_drakma  ];
      inherit stdenv;
      systemName = "cl4store";
      
      sourceProject = "${lisp-project_cl4store}";
      patches = [];
      lisp_dependencies = "${lisp_parser-combinators} ${lisp_log5} ${lisp_cl-rdfxml} ${lisp_drakma}";
      name = "lisp_cl4store-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
