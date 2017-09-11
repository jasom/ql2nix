
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ctrnn, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-ctrnn";
      
      sourceProject = "${lisp-project_cl-ctrnn}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-ctrnn_1.0.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
