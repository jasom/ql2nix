
{ buildLispPackage, stdenv, fetchurl, lisp-project_clinch, 
   lisp_swank, lisp_rtg-math, lisp_sdl2, lisp_trivial-channels, lisp_bordeaux-threads, lisp_cl-opengl, lisp_cl-pango, lisp_cffi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_swank lisp_rtg-math lisp_sdl2 lisp_trivial-channels lisp_bordeaux-threads lisp_cl-opengl lisp_cl-pango lisp_cffi  ];
      inherit stdenv;
      systemName = "clinch-pango";
      
      sourceProject = "${lisp-project_clinch}";
      patches = [];
      lisp_dependencies = "${lisp_swank} ${lisp_rtg-math} ${lisp_sdl2} ${lisp_trivial-channels} ${lisp_bordeaux-threads} ${lisp_cl-opengl} ${lisp_cl-pango} ${lisp_cffi}";
      name = "lisp_clinch-pango-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
