
{ buildLispPackage, stdenv, fetchurl, lisp-project_blackthorn-engine, 
   lisp_alexandria, lisp_cl-containers, lisp_cl-fad, lisp_cl-opengl, lisp_cl-store, lisp_command-line-arguments, lisp_iterate, lisp_lispbuilder-sdl, lisp_lispbuilder-sdl-image, lisp_lispbuilder-sdl-mixer, lisp_mt19937, lisp_trivial-features, lisp_usocket,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-containers lisp_cl-fad lisp_cl-opengl lisp_cl-store lisp_command-line-arguments lisp_iterate lisp_lispbuilder-sdl lisp_lispbuilder-sdl-image lisp_lispbuilder-sdl-mixer lisp_mt19937 lisp_trivial-features lisp_usocket  ];
      inherit stdenv;
      systemName = "blackthorn";
      
      sourceProject = "${lisp-project_blackthorn-engine}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-containers} ${lisp_cl-fad} ${lisp_cl-opengl} ${lisp_cl-store} ${lisp_command-line-arguments} ${lisp_iterate} ${lisp_lispbuilder-sdl} ${lisp_lispbuilder-sdl-image} ${lisp_lispbuilder-sdl-mixer} ${lisp_mt19937} ${lisp_trivial-features} ${lisp_usocket}";
      name = "lisp_blackthorn-20150608-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
