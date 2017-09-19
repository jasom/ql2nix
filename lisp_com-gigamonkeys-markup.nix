
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-markup, 
   lisp_com-gigamonkeys-pathnames, lisp_com-gigamonkeys-utilities, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-gigamonkeys-pathnames lisp_com-gigamonkeys-utilities lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "com.gigamonkeys.markup";
      
      sourceProject = "${lisp-project_monkeylib-markup}";
      patches = [];
      lisp_dependencies = "${lisp_com-gigamonkeys-pathnames} ${lisp_com-gigamonkeys-utilities} ${lisp_cl-ppcre}";
      name = "lisp_com-gigamonkeys-markup-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
