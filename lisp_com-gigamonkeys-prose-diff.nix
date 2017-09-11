
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-prose-diff, 
   lisp_cl-ppcre, lisp_com-gigamonkeys-macro-utilities, lisp_com-gigamonkeys-markup, lisp_com-gigamonkeys-pathnames, lisp_com-gigamonkeys-utilities, lisp_monkeylib-markup-html,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_com-gigamonkeys-macro-utilities lisp_com-gigamonkeys-markup lisp_com-gigamonkeys-pathnames lisp_com-gigamonkeys-utilities lisp_monkeylib-markup-html  ];
      inherit stdenv;
      systemName = "com.gigamonkeys.prose-diff";
      
      sourceProject = "${lisp-project_monkeylib-prose-diff}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_com-gigamonkeys-macro-utilities} ${lisp_com-gigamonkeys-markup} ${lisp_com-gigamonkeys-pathnames} ${lisp_com-gigamonkeys-utilities} ${lisp_monkeylib-markup-html}";
      name = "lisp_com-gigamonkeys-prose-diff-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
