
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-text-output, 
   lisp_com-gigamonkeys-macro-utilities, lisp_com-gigamonkeys-pathnames, lisp_com-gigamonkeys-test-framework, lisp_com-gigamonkeys-utilities,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-gigamonkeys-macro-utilities lisp_com-gigamonkeys-pathnames lisp_com-gigamonkeys-test-framework lisp_com-gigamonkeys-utilities  ];
      inherit stdenv;
      systemName = "monkeylib-text-output";
      
      sourceProject = "${lisp-project_monkeylib-text-output}";
      patches = [];
      lisp_dependencies = "${lisp_com-gigamonkeys-macro-utilities} ${lisp_com-gigamonkeys-pathnames} ${lisp_com-gigamonkeys-test-framework} ${lisp_com-gigamonkeys-utilities}";
      name = "lisp_monkeylib-text-output-20111203-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
