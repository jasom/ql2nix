
{ buildLispPackage, stdenv, fetchurl, lisp-project_docparser, 
   lisp_alexandria, lisp_anaphora, lisp_cffi, lisp_trivial-types,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_cffi lisp_trivial-types  ];
      inherit stdenv;
      systemName = "docparser";
      
      sourceProject = "${lisp-project_docparser}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_cffi} ${lisp_trivial-types}";
      name = "lisp_docparser-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
