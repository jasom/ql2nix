
{ buildLispPackage, stdenv, fetchurl, lisp-project_cells-gtk3, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "ph-maths";
      
      sourceProject = "${lisp-project_cells-gtk3}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_ph-maths-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }