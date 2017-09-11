
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-opengl, 
  mesa,   lisp_alexandria, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi mesa ];
      inherit stdenv;
      systemName = "cl-opengl";
      
      sourceProject = "${lisp-project_cl-opengl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi}";
      name = "lisp_cl-opengl-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
