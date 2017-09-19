
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-markup-html, 
   lisp_monkeylib-html, lisp_com-gigamonkeys-markup, lisp_alexandria, lisp_com-gigamonkeys-macro-utilities,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_monkeylib-html lisp_com-gigamonkeys-markup lisp_alexandria lisp_com-gigamonkeys-macro-utilities  ];
      inherit stdenv;
      systemName = "monkeylib-markup-html";
      
      sourceProject = "${lisp-project_monkeylib-markup-html}";
      patches = [];
      lisp_dependencies = "${lisp_monkeylib-html} ${lisp_com-gigamonkeys-markup} ${lisp_alexandria} ${lisp_com-gigamonkeys-macro-utilities}";
      name = "lisp_monkeylib-markup-html-20120208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
