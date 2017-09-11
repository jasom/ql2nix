
{ buildLispPackage, stdenv, fetchurl, lisp-project_sclf, 
   
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "sclf";
      
      sourceProject = "${lisp-project_sclf}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_sclf-20150207T213551";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
