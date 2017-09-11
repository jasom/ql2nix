
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-markup, 
   lisp_cl-ppcre, lisp_com-gigamonkeys-pathnames, lisp_com-gigamonkeys-utilities,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_com-gigamonkeys-pathnames lisp_com-gigamonkeys-utilities  ];
      inherit stdenv;
      systemName = "com.gigamonkeys.markup";
      
      sourceProject = "${lisp-project_monkeylib-markup}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_com-gigamonkeys-pathnames} ${lisp_com-gigamonkeys-utilities}";
      name = "lisp_com-gigamonkeys-markup-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
