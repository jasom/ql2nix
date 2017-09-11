
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fsnotify, 
   lisp_cffi, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "cl-fsnotify";
      
      sourceProject = "${lisp-project_cl-fsnotify}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cffi-grovel}";
      name = "lisp_cl-fsnotify-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
