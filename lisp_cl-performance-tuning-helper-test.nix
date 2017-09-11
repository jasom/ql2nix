
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-performance-tuning-helper, 
   lisp_cl-performance-tuning-helper, lisp_rt,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-performance-tuning-helper lisp_rt  ];
      inherit stdenv;
      systemName = "cl-performance-tuning-helper-test";
      
      sourceProject = "${lisp-project_cl-performance-tuning-helper}";
      patches = [];
      lisp_dependencies = "${lisp_cl-performance-tuning-helper} ${lisp_rt}";
      name = "lisp_cl-performance-tuning-helper-test-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
