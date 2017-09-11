
{ buildLispPackage, stdenv, fetchurl, lisp-project_gendl, 
   lisp_lift, lisp_surf, lisp_tasty,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_surf lisp_tasty  ];
      inherit stdenv;
      systemName = "regression";
      
      sourceProject = "${lisp-project_gendl}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_surf} ${lisp_tasty}";
      name = "lisp_regression-devo-0272a167-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
