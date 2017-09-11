
{ buildLispPackage, stdenv, fetchurl, lisp-project_kmrcl, 
   lisp_kmrcl, lisp_rt,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_kmrcl lisp_rt  ];
      inherit stdenv;
      systemName = "kmrcl-tests";
      
      sourceProject = "${lisp-project_kmrcl}";
      patches = [];
      lisp_dependencies = "${lisp_kmrcl} ${lisp_rt}";
      name = "lisp_kmrcl-tests-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
