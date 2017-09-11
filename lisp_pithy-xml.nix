
{ buildLispPackage, stdenv, fetchurl, lisp-project_pithy-xml, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "pithy-xml";
      
      sourceProject = "${lisp-project_pithy-xml}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_pithy-xml-20101006-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
