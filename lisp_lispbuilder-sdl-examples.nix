
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
   lisp_lispbuilder-sdl,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lispbuilder-sdl  ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-examples";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_lispbuilder-sdl}";
      name = "lisp_lispbuilder-sdl-examples-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
