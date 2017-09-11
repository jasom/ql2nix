
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gd, 
   lisp_cl-gd,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gd  ];
      inherit stdenv;
      systemName = "cl-gd-test";
      
      sourceProject = "${lisp-project_cl-gd}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gd}";
      name = "lisp_cl-gd-test-0.6.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
