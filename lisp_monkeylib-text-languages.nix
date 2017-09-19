
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-text-languages, 
   lisp_monkeylib-text-output,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_monkeylib-text-output  ];
      inherit stdenv;
      systemName = "monkeylib-text-languages";
      
      sourceProject = "${lisp-project_monkeylib-text-languages}";
      patches = [];
      lisp_dependencies = "${lisp_monkeylib-text-output}";
      name = "lisp_monkeylib-text-languages-20111203-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
