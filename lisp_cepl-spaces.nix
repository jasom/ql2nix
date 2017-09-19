
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-spaces, 
   lisp_cepl, lisp_varjo, lisp_rtg-math, lisp_fn,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cepl lisp_varjo lisp_rtg-math lisp_fn  ];
      inherit stdenv;
      systemName = "cepl.spaces";
      
      sourceProject = "${lisp-project_cepl-spaces}";
      patches = [];
      lisp_dependencies = "${lisp_cepl} ${lisp_varjo} ${lisp_rtg-math} ${lisp_fn}";
      name = "lisp_cepl-spaces-release-quicklisp-a606cb57-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
