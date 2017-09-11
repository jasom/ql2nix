
{ buildLispPackage, stdenv, fetchurl, lisp-project_gamebox-math, 
   lisp_alexandria, lisp_defstar,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_defstar  ];
      inherit stdenv;
      systemName = "gamebox-math";
      
      sourceProject = "${lisp-project_gamebox-math}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_defstar}";
      name = "lisp_gamebox-math-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
