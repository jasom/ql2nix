
{ buildLispPackage, stdenv, fetchurl, lisp-project_paiprolog, 
   
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "paiprolog";
      
      sourceProject = "${lisp-project_paiprolog}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_paiprolog-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
