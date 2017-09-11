
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hash-util, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-hash-util";
      
      sourceProject = "${lisp-project_cl-hash-util}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-hash-util-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
