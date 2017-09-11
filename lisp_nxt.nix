
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-nxt, 
   lisp_babel, lisp_cffi, lisp_static-vectors,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cffi lisp_static-vectors  ];
      inherit stdenv;
      systemName = "nxt";
      
      sourceProject = "${lisp-project_cl-nxt}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cffi} ${lisp_static-vectors}";
      name = "lisp_nxt-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
