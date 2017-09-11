
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-package-system, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "asdf-package-system";
      
      sourceProject = "${lisp-project_asdf-package-system}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_asdf-package-system-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
