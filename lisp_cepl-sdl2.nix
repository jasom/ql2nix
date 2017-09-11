
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-sdl2, 
   lisp_cepl, lisp_sdl2,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cepl lisp_sdl2  ];
      inherit stdenv;
      systemName = "cepl.sdl2";
      
      sourceProject = "${lisp-project_cepl-sdl2}";
      patches = [];
      lisp_dependencies = "${lisp_cepl} ${lisp_sdl2}";
      name = "lisp_cepl-sdl2-release-quicklisp-7374a73e-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
