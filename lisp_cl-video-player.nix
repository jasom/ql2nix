
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-video, 
   lisp_cl-video-avi, lisp_cl-video-gif, lisp_clx, lisp_cl-portaudio,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-video-avi lisp_cl-video-gif lisp_clx lisp_cl-portaudio  ];
      inherit stdenv;
      systemName = "cl-video-player";
      
      sourceProject = "${lisp-project_cl-video}";
      patches = [];
      lisp_dependencies = "${lisp_cl-video-avi} ${lisp_cl-video-gif} ${lisp_clx} ${lisp_cl-portaudio}";
      name = "lisp_cl-video-player-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
