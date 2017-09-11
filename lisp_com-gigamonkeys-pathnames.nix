
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-pathnames, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "com.gigamonkeys.pathnames";
      
      sourceProject = "${lisp-project_monkeylib-pathnames}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_com-gigamonkeys-pathnames-20120208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
