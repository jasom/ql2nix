
{ buildLispPackage, stdenv, fetchurl, lisp-project_prbs, 
   lisp_cl-gendoc,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gendoc  ];
      inherit stdenv;
      systemName = "prbs-docs";
      
      sourceProject = "${lisp-project_prbs}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gendoc}";
      name = "lisp_prbs-docs-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
