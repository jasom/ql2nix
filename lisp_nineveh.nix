
{ buildLispPackage, stdenv, fetchurl, lisp-project_nineveh, 
   lisp_dendrite-primitives, lisp_easing, lisp_livesupport, lisp_cl-soil, lisp_cepl,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_dendrite-primitives lisp_easing lisp_livesupport lisp_cl-soil lisp_cepl  ];
      inherit stdenv;
      systemName = "nineveh";
      
      sourceProject = "${lisp-project_nineveh}";
      patches = [];
      lisp_dependencies = "${lisp_dendrite-primitives} ${lisp_easing} ${lisp_livesupport} ${lisp_cl-soil} ${lisp_cepl}";
      name = "lisp_nineveh-release-quicklisp-06899fb4-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
