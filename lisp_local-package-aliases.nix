
{ buildLispPackage, stdenv, fetchurl, lisp-project_local-package-aliases, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "local-package-aliases";
      
      sourceProject = "${lisp-project_local-package-aliases}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_local-package-aliases-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
