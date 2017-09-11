
{ buildLispPackage, stdenv, fetchurl, lisp-project_macrodynamics, 
   lisp_macrodynamics, lisp_fiasco, lisp_check-it,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_macrodynamics lisp_fiasco lisp_check-it  ];
      inherit stdenv;
      systemName = "macrodynamics/test";
      
      sourceProject = "${lisp-project_macrodynamics}";
      patches = [];
      lisp_dependencies = "${lisp_macrodynamics} ${lisp_fiasco} ${lisp_check-it}";
      name = "lisp_macrodynamics-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
