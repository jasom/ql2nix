
{ buildLispPackage, stdenv, fetchurl, lisp-project_pzmq, 
  zeromq,   lisp_cffi, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cffi-grovel zeromq ];
      inherit stdenv;
      systemName = "pzmq";
      
      sourceProject = "${lisp-project_pzmq}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cffi-grovel}";
      name = "lisp_pzmq-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
