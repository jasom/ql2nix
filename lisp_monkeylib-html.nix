
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-html, 
   lisp_com-gigamonkeys-macro-utilities, lisp_com-gigamonkeys-test-framework, lisp_com-gigamonkeys-pathnames, lisp_com-gigamonkeys-utilities, lisp_monkeylib-text-output, lisp_monkeylib-text-languages,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-gigamonkeys-macro-utilities lisp_com-gigamonkeys-test-framework lisp_com-gigamonkeys-pathnames lisp_com-gigamonkeys-utilities lisp_monkeylib-text-output lisp_monkeylib-text-languages  ];
      inherit stdenv;
      systemName = "monkeylib-html";
      
      sourceProject = "${lisp-project_monkeylib-html}";
      patches = [];
      lisp_dependencies = "${lisp_com-gigamonkeys-macro-utilities} ${lisp_com-gigamonkeys-test-framework} ${lisp_com-gigamonkeys-pathnames} ${lisp_com-gigamonkeys-utilities} ${lisp_monkeylib-text-output} ${lisp_monkeylib-text-languages}";
      name = "lisp_monkeylib-html-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
