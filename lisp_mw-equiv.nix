
{ buildLispPackage, stdenv, fetchurl, lisp-project_mw-equiv, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "mw-equiv";
      
      sourceProject = "${lisp-project_mw-equiv}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_mw-equiv-0.1.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
