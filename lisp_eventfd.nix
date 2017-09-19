
{ buildLispPackage, stdenv, fetchurl, lisp-project_eventfd, 
   lisp_iolib, lisp_cffi-grovel,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iolib lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "eventfd";
      
      sourceProject = "${lisp-project_eventfd}";
      patches = [];
      lisp_dependencies = "${lisp_iolib} ${lisp_cffi-grovel}";
      name = "lisp_eventfd-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
