
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mock, 
   lisp_fiveam, lisp_alexandria, lisp_closer-mop,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_alexandria lisp_closer-mop  ];
      inherit stdenv;
      systemName = "cl-mock-tests-basic";
      
      sourceProject = "${lisp-project_cl-mock}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_alexandria} ${lisp_closer-mop}";
      name = "lisp_cl-mock-tests-basic-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }