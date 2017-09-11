
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sam, 
   lisp_cl-sam, lisp_deoxybyte-io, lisp_lift,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-sam lisp_deoxybyte-io lisp_lift  ];
      inherit stdenv;
      systemName = "cl-sam-test";
      
      sourceProject = "${lisp-project_cl-sam}";
      patches = [];
      lisp_dependencies = "${lisp_cl-sam} ${lisp_deoxybyte-io} ${lisp_lift}";
      name = "lisp_cl-sam-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
