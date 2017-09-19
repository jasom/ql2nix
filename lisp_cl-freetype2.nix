
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-freetype2, 
  freetype,   lisp_trivial-garbage, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_cffi-grovel freetype ];
      inherit stdenv;
      systemName = "cl-freetype2";
      
      sourceProject = "${lisp-project_cl-freetype2}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_cffi-grovel}";
      name = "lisp_cl-freetype2-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
