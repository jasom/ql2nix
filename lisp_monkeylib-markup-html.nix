
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-markup-html, 
   lisp_alexandria, lisp_com-gigamonkeys-macro-utilities, lisp_com-gigamonkeys-markup, lisp_com-gigamonkeys-utilities, lisp_monkeylib-html,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_com-gigamonkeys-macro-utilities lisp_com-gigamonkeys-markup lisp_com-gigamonkeys-utilities lisp_monkeylib-html  ];
      inherit stdenv;
      systemName = "monkeylib-markup-html";
      
      sourceProject = "${lisp-project_monkeylib-markup-html}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_com-gigamonkeys-macro-utilities} ${lisp_com-gigamonkeys-markup} ${lisp_com-gigamonkeys-utilities} ${lisp_monkeylib-html}";
      name = "lisp_monkeylib-markup-html-20120208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
