
{ buildLispPackage, stdenv, fetchurl, lisp-project_mixalot, 
   lisp_cffi, lisp_mixalot, lisp_vorbisfile-ffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_mixalot lisp_vorbisfile-ffi  ];
      inherit stdenv;
      systemName = "mixalot-vorbis";
      
      sourceProject = "${lisp-project_mixalot}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_mixalot} ${lisp_vorbisfile-ffi}";
      name = "lisp_mixalot-vorbis-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
