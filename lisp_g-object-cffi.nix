
{ buildLispPackage, stdenv, fetchurl, lisp-project_gtk-cffi, 
   lisp_g-lib-cffi, lisp_gtk-cffi-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_g-lib-cffi lisp_gtk-cffi-utils  ];
      inherit stdenv;
      systemName = "g-object-cffi";
      
      sourceProject = "${lisp-project_gtk-cffi}";
      patches = [];
      lisp_dependencies = "${lisp_g-lib-cffi} ${lisp_gtk-cffi-utils}";
      name = "lisp_g-object-cffi-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
