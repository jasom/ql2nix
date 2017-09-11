
{ buildLispPackage, stdenv, fetchurl, lisp-project_gamebox-grids, 
   lisp_alexandria, lisp_gamebox-math,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_gamebox-math  ];
      inherit stdenv;
      systemName = "gamebox-grids";
      
      sourceProject = "${lisp-project_gamebox-grids}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_gamebox-math}";
      name = "lisp_gamebox-grids-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
