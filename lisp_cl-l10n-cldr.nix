
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-l10n-cldr, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-l10n-cldr";
      
      sourceProject = "${lisp-project_cl-l10n-cldr}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-l10n-cldr-20120909-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
