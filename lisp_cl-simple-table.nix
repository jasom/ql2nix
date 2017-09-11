
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-simple-table, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-simple-table";
      
      sourceProject = "${lisp-project_cl-simple-table}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-simple-table-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
