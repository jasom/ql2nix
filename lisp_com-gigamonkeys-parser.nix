
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-parser, 
   lisp_com-gigamonkeys-macro-utilities, lisp_com-gigamonkeys-utilities,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-gigamonkeys-macro-utilities lisp_com-gigamonkeys-utilities  ];
      inherit stdenv;
      systemName = "com.gigamonkeys.parser";
      
      sourceProject = "${lisp-project_monkeylib-parser}";
      patches = [];
      lisp_dependencies = "${lisp_com-gigamonkeys-macro-utilities} ${lisp_com-gigamonkeys-utilities}";
      name = "lisp_com-gigamonkeys-parser-20120208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
