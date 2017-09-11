
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-text-languages, 
   lisp_com-gigamonkeys-macro-utilities, lisp_monkeylib-text-output,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-gigamonkeys-macro-utilities lisp_monkeylib-text-output  ];
      inherit stdenv;
      systemName = "monkeylib-text-languages";
      
      sourceProject = "${lisp-project_monkeylib-text-languages}";
      patches = [];
      lisp_dependencies = "${lisp_com-gigamonkeys-macro-utilities} ${lisp_monkeylib-text-output}";
      name = "lisp_monkeylib-text-languages-20111203-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
