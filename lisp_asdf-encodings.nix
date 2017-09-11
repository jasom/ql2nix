
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-encodings, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "asdf-encodings";
      
      sourceProject = "${lisp-project_asdf-encodings}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_asdf-encodings-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
