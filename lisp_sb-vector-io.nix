
{ buildLispPackage, stdenv, fetchurl, lisp-project_sb-vector-io, 
   
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "sb-vector-io";
      
      sourceProject = "${lisp-project_sb-vector-io}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_sb-vector-io-20110829-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
