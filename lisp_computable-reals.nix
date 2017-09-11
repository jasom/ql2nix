
{ buildLispPackage, stdenv, fetchurl, lisp-project_computable-reals, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "computable-reals";
      
      sourceProject = "${lisp-project_computable-reals}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_computable-reals-20130312-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
