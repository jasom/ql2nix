
{ buildLispPackage, stdenv, fetchurl, lisp-project_meta-sexp, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "meta-sexp";
      
      sourceProject = "${lisp-project_meta-sexp}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_meta-sexp-0.1.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
