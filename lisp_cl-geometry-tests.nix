
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-geometry, 
   lisp_cl-geometry, lisp_iterate, lisp_vecto,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-geometry lisp_iterate lisp_vecto  ];
      inherit stdenv;
      systemName = "cl-geometry-tests";
      
      sourceProject = "${lisp-project_cl-geometry}";
      patches = [];
      lisp_dependencies = "${lisp_cl-geometry} ${lisp_iterate} ${lisp_vecto}";
      name = "lisp_cl-geometry-tests-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
