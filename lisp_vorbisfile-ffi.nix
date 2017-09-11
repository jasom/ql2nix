
{ buildLispPackage, stdenv, fetchurl, lisp-project_mixalot, 
  libvorbis,   lisp_cffi, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cffi-grovel libvorbis ];
      inherit stdenv;
      systemName = "vorbisfile-ffi";
      
      sourceProject = "${lisp-project_mixalot}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cffi-grovel}";
      name = "lisp_vorbisfile-ffi-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
