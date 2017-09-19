
{ buildLispPackage, stdenv, fetchurl, lisp-project_ubiquitous, 
   
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "ubiquitous";
      
      sourceProject = "${lisp-project_ubiquitous}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_ubiquitous-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
