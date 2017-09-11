
{ buildLispPackage, stdenv, fetchurl, lisp-project_s-sysdeps, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "s-sysdeps";
      
      sourceProject = "${lisp-project_s-sysdeps}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_s-sysdeps-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
