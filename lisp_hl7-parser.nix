
{ buildLispPackage, stdenv, fetchurl, lisp-project_hl7-parser, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "hl7-parser";
      
      sourceProject = "${lisp-project_hl7-parser}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_hl7-parser-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
