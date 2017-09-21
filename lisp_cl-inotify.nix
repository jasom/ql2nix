
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-inotify, 
   lisp_osicat, lisp_trivial-utf-8, lisp_binary-types, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_osicat lisp_trivial-utf-8 lisp_binary-types lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "cl-inotify";
      
      sourceProject = "${lisp-project_cl-inotify}";
      patches = [];
      lisp_dependencies = "${lisp_osicat} ${lisp_trivial-utf-8} ${lisp_binary-types} ${lisp_cffi-grovel}";
      name = "lisp_cl-inotify-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
