
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
   lisp_cl-aa-misc, lisp_cl-paths-ttf, lisp_cl-vectors, lisp_lispbuilder-sdl, lisp_zpb-ttf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-aa-misc lisp_cl-paths-ttf lisp_cl-vectors lisp_lispbuilder-sdl lisp_zpb-ttf  ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-cl-vectors";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cl-aa-misc} ${lisp_cl-paths-ttf} ${lisp_cl-vectors} ${lisp_lispbuilder-sdl} ${lisp_zpb-ttf}";
      name = "lisp_lispbuilder-sdl-cl-vectors-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
