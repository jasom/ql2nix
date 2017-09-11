
{ buildLispPackage, stdenv, fetchurl, lisp-project_parse-declarations, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "parse-declarations-1.0";
      
      sourceProject = "${lisp-project_parse-declarations}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_parse-declarations-1-0-20101006-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
