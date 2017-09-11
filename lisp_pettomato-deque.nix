
{ buildLispPackage, stdenv, fetchurl, lisp-project_pettomato-deque, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "pettomato-deque";
      
      sourceProject = "${lisp-project_pettomato-deque}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_pettomato-deque-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
