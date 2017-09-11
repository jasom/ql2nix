
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-match, 
   lisp_standard-cl,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_standard-cl  ];
      inherit stdenv;
      systemName = "pcl-unit-test";
      
      sourceProject = "${lisp-project_cl-match}";
      patches = [];
      lisp_dependencies = "${lisp_standard-cl}";
      name = "lisp_pcl-unit-test-20121125-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
