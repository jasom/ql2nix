
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sdl2, 
   lisp_sdl2, lisp_cl-opengl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_sdl2 lisp_cl-opengl  ];
      inherit stdenv;
      systemName = "sdl2/examples";
      
      sourceProject = "${lisp-project_cl-sdl2}";
      patches = [];
      lisp_dependencies = "${lisp_sdl2} ${lisp_cl-opengl}";
      name = "lisp_sdl2-examples-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
