
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-drm-gbm, 
   lisp_cl-egl, lisp_cl-gbm, lisp_cl-drm, lisp_osicat, lisp_cepl,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-egl lisp_cl-gbm lisp_cl-drm lisp_osicat lisp_cepl  ];
      inherit stdenv;
      systemName = "cepl.drm-gbm";
      
      sourceProject = "${lisp-project_cepl-drm-gbm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-egl} ${lisp_cl-gbm} ${lisp_cl-drm} ${lisp_osicat} ${lisp_cepl}";
      name = "lisp_cepl-drm-gbm-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
