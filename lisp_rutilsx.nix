
{ buildLispPackage, stdenv, fetchurl, lisp-project_rutils, 
   lisp_closer-mop, lisp_named-readtables, lisp_rutils,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_named-readtables lisp_rutils  ];
      inherit stdenv;
      systemName = "rutilsx";
      
      sourceProject = "${lisp-project_rutils}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_named-readtables} ${lisp_rutils}";
      name = "lisp_rutilsx-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
