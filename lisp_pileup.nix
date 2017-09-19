
{ buildLispPackage, stdenv, fetchurl, lisp-project_pileup, 
   lisp_bordeaux-threads, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_alexandria  ];
      inherit stdenv;
      systemName = "pileup";
      
      sourceProject = "${lisp-project_pileup}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_alexandria}";
      name = "lisp_pileup-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
