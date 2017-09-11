
{ buildLispPackage, stdenv, fetchurl, lisp-project_skitter, 
   lisp_skitter, lisp_sdl2,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_skitter lisp_sdl2  ];
      inherit stdenv;
      systemName = "skitter.sdl2";
      
      sourceProject = "${lisp-project_skitter}";
      patches = [];
      lisp_dependencies = "${lisp_skitter} ${lisp_sdl2}";
      name = "lisp_skitter-sdl2-release-quicklisp-dd15a0b5-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
