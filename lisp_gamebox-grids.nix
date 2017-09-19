
{ buildLispPackage, stdenv, fetchurl, lisp-project_gamebox-grids, 
   lisp_gamebox-math, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_gamebox-math lisp_alexandria  ];
      inherit stdenv;
      systemName = "gamebox-grids";
      
      sourceProject = "${lisp-project_gamebox-grids}";
      patches = [];
      lisp_dependencies = "${lisp_gamebox-math} ${lisp_alexandria}";
      name = "lisp_gamebox-grids-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
