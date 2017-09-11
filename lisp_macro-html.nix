
{ buildLispPackage, stdenv, fetchurl, lisp-project_macro-html, 
   lisp_named-readtables,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables  ];
      inherit stdenv;
      systemName = "macro-html";
      
      sourceProject = "${lisp-project_macro-html}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables}";
      name = "lisp_macro-html-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
