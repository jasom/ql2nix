
{ buildLispPackage, stdenv, fetchurl, lisp-project_nineveh, 
   lisp_cepl, lisp_cl-soil, lisp_livesupport, lisp_easing, lisp_dendrite-primitives,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cepl lisp_cl-soil lisp_livesupport lisp_easing lisp_dendrite-primitives  ];
      inherit stdenv;
      systemName = "nineveh";
      
      sourceProject = "${lisp-project_nineveh}";
      patches = [];
      lisp_dependencies = "${lisp_cepl} ${lisp_cl-soil} ${lisp_livesupport} ${lisp_easing} ${lisp_dendrite-primitives}";
      name = "lisp_nineveh-release-quicklisp-fd995883-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
