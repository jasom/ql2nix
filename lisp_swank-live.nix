
{ buildLispPackage, stdenv, fetchurl, lisp-project_swank-live, 
   lisp_swank,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_swank  ];
      inherit stdenv;
      systemName = "swank.live";
      
      sourceProject = "${lisp-project_swank-live}";
      patches = [];
      lisp_dependencies = "${lisp_swank}";
      name = "lisp_swank-live-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
