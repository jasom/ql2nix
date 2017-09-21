
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-sdl2, 
   lisp_sdl2, lisp_cepl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_sdl2 lisp_cepl  ];
      inherit stdenv;
      systemName = "cepl.sdl2";
      
      sourceProject = "${lisp-project_cepl-sdl2}";
      patches = [];
      lisp_dependencies = "${lisp_sdl2} ${lisp_cepl}";
      name = "lisp_cepl-sdl2-release-quicklisp-6cb7a8db-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }