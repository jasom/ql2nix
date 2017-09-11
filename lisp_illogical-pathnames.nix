
{ buildLispPackage, stdenv, fetchurl, lisp-project_illogical-pathnames, 
   
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "illogical-pathnames";
      
      sourceProject = "${lisp-project_illogical-pathnames}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_illogical-pathnames-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
