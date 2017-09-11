
{ buildLispPackage, stdenv, fetchurl, lisp-project_xarray, 
   lisp_lift, lisp_xarray,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_xarray  ];
      inherit stdenv;
      systemName = "xarray-test";
      
      sourceProject = "${lisp-project_xarray}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_xarray}";
      name = "lisp_xarray-test-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
