
{ buildLispPackage, stdenv, fetchurl, lisp-project_bubble-operator-upwards, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "bubble-operator-upwards";
      
      sourceProject = "${lisp-project_bubble-operator-upwards}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_bubble-operator-upwards-1.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
