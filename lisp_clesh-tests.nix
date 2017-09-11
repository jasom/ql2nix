
{ buildLispPackage, stdenv, fetchurl, lisp-project_clesh, 
   lisp_clesh, lisp_lisp-unit,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clesh lisp_lisp-unit  ];
      inherit stdenv;
      systemName = "clesh-tests";
      
      sourceProject = "${lisp-project_clesh}";
      patches = [];
      lisp_dependencies = "${lisp_clesh} ${lisp_lisp-unit}";
      name = "lisp_clesh-tests-20120208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
