
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-glop, 
   lisp_cepl, lisp_glop,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cepl lisp_glop  ];
      inherit stdenv;
      systemName = "cepl.glop";
      
      sourceProject = "${lisp-project_cepl-glop}";
      patches = [];
      lisp_dependencies = "${lisp_cepl} ${lisp_glop}";
      name = "lisp_cepl-glop-release-quicklisp-93c9eb77-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
