
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-geos, 
  geos,   lisp_cffi, lisp_trivial-garbage, lisp_xarray,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_trivial-garbage lisp_xarray geos ];
      inherit stdenv;
      systemName = "cl-geos";
      
      sourceProject = "${lisp-project_cl-geos}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_trivial-garbage} ${lisp_xarray}";
      name = "lisp_cl-geos-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
