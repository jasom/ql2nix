
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-custom-hash-table, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-custom-hash-table";
      
      sourceProject = "${lisp-project_cl-custom-hash-table}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-custom-hash-table-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
