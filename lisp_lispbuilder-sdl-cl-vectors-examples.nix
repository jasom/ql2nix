
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
   lisp_lispbuilder-sdl-cl-vectors,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lispbuilder-sdl-cl-vectors  ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-cl-vectors-examples";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_lispbuilder-sdl-cl-vectors}";
      name = "lisp_lispbuilder-sdl-cl-vectors-examples-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
