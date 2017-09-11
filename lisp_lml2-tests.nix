
{ buildLispPackage, stdenv, fetchurl, lisp-project_lml2, 
   lisp_lml2, lisp_rt,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lml2 lisp_rt  ];
      inherit stdenv;
      systemName = "lml2-tests";
      
      sourceProject = "${lisp-project_lml2}";
      patches = [];
      lisp_dependencies = "${lisp_lml2} ${lisp_rt}";
      name = "lisp_lml2-tests-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
