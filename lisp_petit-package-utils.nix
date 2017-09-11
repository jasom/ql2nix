
{ buildLispPackage, stdenv, fetchurl, lisp-project_petit-package-utils, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "petit.package-utils";
      
      sourceProject = "${lisp-project_petit-package-utils}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_petit-package-utils-20140826-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
