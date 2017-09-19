
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-video, 
   lisp_cl-portaudio, lisp_clx, lisp_skippy, lisp_flexi-streams, lisp_bordeaux-threads, lisp_cl-jpeg, lisp_cl-riff, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-portaudio lisp_clx lisp_skippy lisp_flexi-streams lisp_bordeaux-threads lisp_cl-jpeg lisp_cl-riff lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-video-player";
      
      sourceProject = "${lisp-project_cl-video}";
      patches = [];
      lisp_dependencies = "${lisp_cl-portaudio} ${lisp_clx} ${lisp_skippy} ${lisp_flexi-streams} ${lisp_bordeaux-threads} ${lisp_cl-jpeg} ${lisp_cl-riff} ${lisp_alexandria}";
      name = "lisp_cl-video-player-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
