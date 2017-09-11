
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-video, 
   lisp_alexandria, lisp_cl-riff, lisp_cl-jpeg, lisp_cl-video, lisp_flexi-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-riff lisp_cl-jpeg lisp_cl-video lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "cl-video-avi";
      
      sourceProject = "${lisp-project_cl-video}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-riff} ${lisp_cl-jpeg} ${lisp_cl-video} ${lisp_flexi-streams}";
      name = "lisp_cl-video-avi-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
