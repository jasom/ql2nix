
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-pixman, 
  xorg,   lisp_alexandria, lisp_cffi, lisp_trivial-garbage,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_trivial-garbage xorg.pixman ];
      inherit stdenv;
      systemName = "pixman";
      
      sourceProject = "${lisp-project_cl-pixman}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_trivial-garbage}";
      name = "lisp_pixman-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
