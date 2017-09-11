
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-open-browser, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "trivial-open-browser";
      
      sourceProject = "${lisp-project_trivial-open-browser}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_trivial-open-browser-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
