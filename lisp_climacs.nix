
{ buildLispPackage, stdenv, fetchurl, lisp-project_climacs, 
   lisp_mcclim,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mcclim  ];
      inherit stdenv;
      systemName = "climacs";
      
      sourceProject = "${lisp-project_climacs}";
      patches = [];
      lisp_dependencies = "${lisp_mcclim}";
      name = "lisp_climacs-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
