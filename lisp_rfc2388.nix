
{ buildLispPackage, stdenv, fetchurl, lisp-project_rfc2388, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "rfc2388";
      
      sourceProject = "${lisp-project_rfc2388}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_rfc2388-20130720-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
