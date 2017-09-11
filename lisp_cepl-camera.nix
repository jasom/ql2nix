
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-camera, 
   lisp_cepl, lisp_cepl-spaces,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cepl lisp_cepl-spaces  ];
      inherit stdenv;
      systemName = "cepl.camera";
      
      sourceProject = "${lisp-project_cepl-camera}";
      patches = [];
      lisp_dependencies = "${lisp_cepl} ${lisp_cepl-spaces}";
      name = "lisp_cepl-camera-release-quicklisp-1292212a-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
