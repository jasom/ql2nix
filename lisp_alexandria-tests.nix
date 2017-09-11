
{ buildLispPackage, stdenv, fetchurl, lisp-project_alexandria, 
   lisp_rt,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rt  ];
      inherit stdenv;
      systemName = "alexandria-tests";
      
      sourceProject = "${lisp-project_alexandria}";
      patches = [];
      lisp_dependencies = "${lisp_rt}";
      name = "lisp_alexandria-tests-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
