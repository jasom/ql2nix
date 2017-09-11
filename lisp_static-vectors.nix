
{ buildLispPackage, stdenv, fetchurl, lisp-project_static-vectors, 
   lisp_alexandria, lisp_cffi, lisp_cffi-grovel,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "static-vectors";
      
      sourceProject = "${lisp-project_static-vectors}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cffi-grovel}";
      name = "lisp_static-vectors-v1.8.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
