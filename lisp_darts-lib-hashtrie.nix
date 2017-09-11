
{ buildLispPackage, stdenv, fetchurl, lisp-project_dartsclhashtree, 
   
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "darts.lib.hashtrie";
      
      sourceProject = "${lisp-project_dartsclhashtree}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_darts-lib-hashtrie-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
