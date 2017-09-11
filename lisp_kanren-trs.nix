
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-kanren-trs, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "kanren-trs";
      
      sourceProject = "${lisp-project_cl-kanren-trs}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_kanren-trs-20120305-svn";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
