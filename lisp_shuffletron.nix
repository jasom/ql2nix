
{ buildLispPackage, stdenv, fetchurl, lisp-project_shuffletron, 
  libvorbis, flac,   lisp_mixalot-mp3, lisp_mixalot, lisp_osicat,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mixalot-mp3 lisp_mixalot lisp_osicat libvorbis flac ];
      inherit stdenv;
      systemName = "shuffletron";
      
      sourceProject = "${lisp-project_shuffletron}";
      patches = [];
      lisp_dependencies = "${lisp_mixalot-mp3} ${lisp_mixalot} ${lisp_osicat}";
      name = "lisp_shuffletron-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
