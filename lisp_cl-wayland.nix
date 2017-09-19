
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-wayland, 
  wayland,   lisp_closer-mop, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_cffi wayland ];
      inherit stdenv;
      systemName = "cl-wayland";
      
      sourceProject = "${lisp-project_cl-wayland}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_cffi}";
      name = "lisp_cl-wayland-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
