
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-png, 
  libpng, libpng12,   lisp_cffi-grovel,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-grovel libpng libpng12 ];
      inherit stdenv;
      systemName = "png";
      
      sourceProject = "${lisp-project_cl-png}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-grovel}";
      name = "lisp_png-0.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
