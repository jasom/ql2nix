
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-skitter, 
   lisp_skitter-sdl2, lisp_cepl-sdl2,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_skitter-sdl2 lisp_cepl-sdl2  ];
      inherit stdenv;
      systemName = "cepl.skitter.sdl2";
      
      sourceProject = "${lisp-project_cepl-skitter}";
      patches = [];
      lisp_dependencies = "${lisp_skitter-sdl2} ${lisp_cepl-sdl2}";
      name = "lisp_cepl-skitter-sdl2-release-quicklisp-f52b9240-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
