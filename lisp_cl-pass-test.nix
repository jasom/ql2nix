
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-pass, 
   lisp_cl-pass, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-pass lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-pass-test";
      
      sourceProject = "${lisp-project_cl-pass}";
      patches = [];
      lisp_dependencies = "${lisp_cl-pass} ${lisp_fiveam}";
      name = "lisp_cl-pass-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }