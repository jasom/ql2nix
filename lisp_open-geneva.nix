
{ buildLispPackage, stdenv, fetchurl, lisp-project_geneva, 
   lisp_trivial-documentation, lisp_texp, lisp_file-types, lisp_macro-html, lisp_maxpc, lisp_named-readtables, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-documentation lisp_texp lisp_file-types lisp_macro-html lisp_maxpc lisp_named-readtables lisp_split-sequence  ];
      inherit stdenv;
      systemName = "open-geneva";
      
      sourceProject = "${lisp-project_geneva}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-documentation} ${lisp_texp} ${lisp_file-types} ${lisp_macro-html} ${lisp_maxpc} ${lisp_named-readtables} ${lisp_split-sequence}";
      name = "lisp_open-geneva-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
