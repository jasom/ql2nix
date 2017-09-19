
{ buildLispPackage, stdenv, fetchurl, lisp-project_geneva, 
   lisp_file-types, lisp_macro-html, lisp_named-readtables, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_file-types lisp_macro-html lisp_named-readtables lisp_split-sequence  ];
      inherit stdenv;
      systemName = "geneva-html";
      
      sourceProject = "${lisp-project_geneva}";
      patches = [];
      lisp_dependencies = "${lisp_file-types} ${lisp_macro-html} ${lisp_named-readtables} ${lisp_split-sequence}";
      name = "lisp_geneva-html-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
