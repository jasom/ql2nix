
{ buildLispPackage, stdenv, fetchurl, lisp-project_dendrite, 
   lisp_dendrite-primitives,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_dendrite-primitives  ];
      inherit stdenv;
      systemName = "dendrite";
      
      sourceProject = "${lisp-project_dendrite}";
      patches = [];
      lisp_dependencies = "${lisp_dendrite-primitives}";
      name = "lisp_dendrite-release-quicklisp-662aedba-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
