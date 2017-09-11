
{ buildLispPackage, stdenv, fetchurl, lisp-project_pcall, 
   lisp_bordeaux-threads, lisp_pcall-queue,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_pcall-queue  ];
      inherit stdenv;
      systemName = "pcall";
      
      sourceProject = "${lisp-project_pcall}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_pcall-queue}";
      name = "lisp_pcall-0.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
