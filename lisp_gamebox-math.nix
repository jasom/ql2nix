
{ buildLispPackage, stdenv, fetchurl, lisp-project_gamebox-math, 
   lisp_defstar, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_defstar lisp_alexandria  ];
      inherit stdenv;
      systemName = "gamebox-math";
      
      sourceProject = "${lisp-project_gamebox-math}";
      patches = [];
      lisp_dependencies = "${lisp_defstar} ${lisp_alexandria}";
      name = "lisp_gamebox-math-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
