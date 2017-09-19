
{ buildLispPackage, stdenv, fetchurl, lisp-project_fft, 
   lisp_pcall,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_pcall  ];
      inherit stdenv;
      systemName = "pfft";
      
      sourceProject = "${lisp-project_fft}";
      patches = [];
      lisp_dependencies = "${lisp_pcall}";
      name = "lisp_pfft-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
