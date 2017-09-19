
{ buildLispPackage, stdenv, fetchurl, lisp-project_inotify, 
   lisp_iolib, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iolib lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "inotify";
      
      sourceProject = "${lisp-project_inotify}";
      patches = [];
      lisp_dependencies = "${lisp_iolib} ${lisp_cffi-grovel}";
      name = "lisp_inotify-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
