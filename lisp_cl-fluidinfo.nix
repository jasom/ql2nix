
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fluidinfo, 
   lisp_cl-fluiddb,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fluiddb  ];
      inherit stdenv;
      systemName = "cl-fluidinfo";
      
      sourceProject = "${lisp-project_cl-fluidinfo}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fluiddb}";
      name = "lisp_cl-fluidinfo-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
