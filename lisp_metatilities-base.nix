
{ buildLispPackage, stdenv, fetchurl, lisp-project_metatilities-base, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "metatilities-base";
      
      sourceProject = "${lisp-project_metatilities-base}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_metatilities-base-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
