
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-spaces, 
   lisp_fn, lisp_rtg-math, lisp_varjo, lisp_cepl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fn lisp_rtg-math lisp_varjo lisp_cepl  ];
      inherit stdenv;
      systemName = "cepl.spaces";
      
      sourceProject = "${lisp-project_cepl-spaces}";
      patches = [];
      lisp_dependencies = "${lisp_fn} ${lisp_rtg-math} ${lisp_varjo} ${lisp_cepl}";
      name = "lisp_cepl-spaces-release-quicklisp-a606cb57-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
