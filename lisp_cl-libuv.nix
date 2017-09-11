
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-libuv, 
  libuv,   lisp_alexandria, lisp_cffi, lisp_cffi-grovel,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cffi-grovel libuv ];
      inherit stdenv;
      systemName = "cl-libuv";
      
      sourceProject = "${lisp-project_cl-libuv}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cffi-grovel}";
      name = "lisp_cl-libuv-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
