
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-match, 
   lisp_cl-match, lisp_pcl-unit-test,  
  sbcl, clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-match lisp_pcl-unit-test  ];
      inherit stdenv;
      systemName = "cl-match-test";
      
      sourceProject = "${lisp-project_cl-match}";
      patches = [];
      lisp_dependencies = "${lisp_cl-match} ${lisp_pcl-unit-test}";
      name = "lisp_cl-match-test-20121125-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" ];
    }
