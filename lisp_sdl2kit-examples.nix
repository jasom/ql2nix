
{ buildLispPackage, stdenv, fetchurl, lisp-project_sdl2kit, 
   lisp_alexandria, lisp_sdl2kit, lisp_glkit,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_sdl2kit lisp_glkit  ];
      inherit stdenv;
      systemName = "sdl2kit-examples";
      
      sourceProject = "${lisp-project_sdl2kit}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_sdl2kit} ${lisp_glkit}";
      name = "lisp_sdl2kit-examples-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
