
{ buildLispPackage, stdenv, fetchurl, lisp-project_clinch, 
   lisp_cl-freeimage, lisp_swank, lisp_rtg-math, lisp_sdl2, lisp_trivial-channels, lisp_bordeaux-threads, lisp_trivial-garbage, lisp_cl-opengl, lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-freeimage lisp_swank lisp_rtg-math lisp_sdl2 lisp_trivial-channels lisp_bordeaux-threads lisp_trivial-garbage lisp_cl-opengl lisp_cffi  ];
      inherit stdenv;
      systemName = "clinch-freeimage";
      
      sourceProject = "${lisp-project_clinch}";
      patches = [];
      lisp_dependencies = "${lisp_cl-freeimage} ${lisp_swank} ${lisp_rtg-math} ${lisp_sdl2} ${lisp_trivial-channels} ${lisp_bordeaux-threads} ${lisp_trivial-garbage} ${lisp_cl-opengl} ${lisp_cffi}";
      name = "lisp_clinch-freeimage-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
