
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
   lisp_lispbuilder-sdl, lisp_lispbuilder-sdl-cl-vectors, lisp_vecto,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lispbuilder-sdl lisp_lispbuilder-sdl-cl-vectors lisp_vecto  ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-vecto";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_lispbuilder-sdl} ${lisp_lispbuilder-sdl-cl-vectors} ${lisp_vecto}";
      name = "lisp_lispbuilder-sdl-vecto-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
