
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-video, 
   lisp_cl-video, lisp_skippy,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-video lisp_skippy  ];
      inherit stdenv;
      systemName = "cl-video-gif";
      
      sourceProject = "${lisp-project_cl-video}";
      patches = [];
      lisp_dependencies = "${lisp_cl-video} ${lisp_skippy}";
      name = "lisp_cl-video-gif-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }