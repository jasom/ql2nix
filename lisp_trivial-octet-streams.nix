
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-octet-streams, 
   
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "trivial-octet-streams";
      
      sourceProject = "${lisp-project_trivial-octet-streams}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_trivial-octet-streams-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
