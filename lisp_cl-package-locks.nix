
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-package-locks, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-package-locks";
      
      sourceProject = "${lisp-project_cl-package-locks}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-package-locks-20111203-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
