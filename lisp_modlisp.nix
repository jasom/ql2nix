
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-modlisp, 
   lisp_kmrcl,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_kmrcl  ];
      inherit stdenv;
      systemName = "modlisp";
      
      sourceProject = "${lisp-project_cl-modlisp}";
      patches = [];
      lisp_dependencies = "${lisp_kmrcl}";
      name = "lisp_modlisp-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
