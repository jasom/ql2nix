
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gearman, 
   lisp_cl-gearman, lisp_cl-test-more,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gearman lisp_cl-test-more  ];
      inherit stdenv;
      systemName = "cl-gearman-test";
      
      sourceProject = "${lisp-project_cl-gearman}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gearman} ${lisp_cl-test-more}";
      name = "lisp_cl-gearman-test-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
