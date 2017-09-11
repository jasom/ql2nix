
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-macro-utilities, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "com.gigamonkeys.macro-utilities";
      
      sourceProject = "${lisp-project_monkeylib-macro-utilities}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_com-gigamonkeys-macro-utilities-20111203-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
