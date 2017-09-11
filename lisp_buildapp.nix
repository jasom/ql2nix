
{ buildLispPackage, stdenv, fetchurl, lisp-project_buildapp, 
   
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "buildapp";
      
      sourceProject = "${lisp-project_buildapp}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_buildapp-1.5.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
