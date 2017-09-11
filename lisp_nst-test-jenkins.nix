
{ buildLispPackage, stdenv, fetchurl, lisp-project_nst, 
   lisp_asdf-nst, lisp_nst, lisp_nst-test,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-nst lisp_nst lisp_nst-test  ];
      inherit stdenv;
      systemName = "nst-test-jenkins";
      
      sourceProject = "${lisp-project_nst}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-nst} ${lisp_nst} ${lisp_nst-test}";
      name = "lisp_nst-test-jenkins-4.1.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
