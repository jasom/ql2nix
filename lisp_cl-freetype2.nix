
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-freetype2, 
  freetype,   lisp_alexandria, lisp_cffi, lisp_cffi-grovel, lisp_trivial-garbage,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cffi-grovel lisp_trivial-garbage freetype ];
      inherit stdenv;
      systemName = "cl-freetype2";
      
      sourceProject = "${lisp-project_cl-freetype2}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cffi-grovel} ${lisp_trivial-garbage}";
      name = "lisp_cl-freetype2-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
