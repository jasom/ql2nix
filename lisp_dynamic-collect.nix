
{ buildLispPackage, stdenv, fetchurl, lisp-project_dynamic-collect, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "dynamic-collect";
      
      sourceProject = "${lisp-project_dynamic-collect}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_dynamic-collect-20140713-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
