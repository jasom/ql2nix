
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-signal, 
   lisp_bordeaux-threads, lisp_cffi, lisp_cffi-grovel,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cffi lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "trivial-signal";
      
      sourceProject = "${lisp-project_trivial-signal}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_cffi-grovel}";
      name = "lisp_trivial-signal-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
