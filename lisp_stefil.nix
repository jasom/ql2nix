
{ buildLispPackage, stdenv, fetchurl, lisp-project_stefil, 
   lisp_metabang-bind, lisp_iterate, lisp_alexandria, lisp_swank,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metabang-bind lisp_iterate lisp_alexandria lisp_swank  ];
      inherit stdenv;
      systemName = "stefil";
      
      sourceProject = "${lisp-project_stefil}";
      patches = [];
      lisp_dependencies = "${lisp_metabang-bind} ${lisp_iterate} ${lisp_alexandria} ${lisp_swank}";
      name = "lisp_stefil-20101107-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
