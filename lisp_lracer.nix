
{ buildLispPackage, stdenv, fetchurl, lisp-project_racer, 
   
  clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "lracer";
      
      sourceProject = "${lisp-project_racer}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_lracer-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" ];
    }
