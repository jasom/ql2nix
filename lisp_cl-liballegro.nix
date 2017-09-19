
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-liballegro, 
  allegro5,   lisp_trivial-garbage, lisp_cffi-libffi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_cffi-libffi allegro5 ];
      inherit stdenv;
      systemName = "cl-liballegro";
      
      sourceProject = "${lisp-project_cl-liballegro}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_cffi-libffi}";
      name = "lisp_cl-liballegro-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
