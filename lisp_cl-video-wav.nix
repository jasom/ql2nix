
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-video, 
   lisp_flexi-streams, lisp_bordeaux-threads, lisp_cl-riff, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_bordeaux-threads lisp_cl-riff lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-video-wav";
      
      sourceProject = "${lisp-project_cl-video}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_bordeaux-threads} ${lisp_cl-riff} ${lisp_alexandria}";
      name = "lisp_cl-video-wav-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
