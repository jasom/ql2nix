
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-vectors, 
   lisp_zpb-ttf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_zpb-ttf  ];
      inherit stdenv;
      systemName = "cl-paths-ttf";
      
      sourceProject = "${lisp-project_cl-vectors}";
      patches = [];
      lisp_dependencies = "${lisp_zpb-ttf}";
      name = "lisp_cl-paths-ttf-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
