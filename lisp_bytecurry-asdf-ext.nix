
{ buildLispPackage, stdenv, fetchurl, lisp-project_bytecurry-asdf-ext, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "bytecurry.asdf-ext";
      
      sourceProject = "${lisp-project_bytecurry-asdf-ext}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_bytecurry-asdf-ext-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
