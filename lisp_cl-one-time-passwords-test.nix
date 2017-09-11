
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-one-time-passwords, 
   lisp_cl-one-time-passwords, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-one-time-passwords lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-one-time-passwords-test";
      
      sourceProject = "${lisp-project_cl-one-time-passwords}";
      patches = [];
      lisp_dependencies = "${lisp_cl-one-time-passwords} ${lisp_fiveam}";
      name = "lisp_cl-one-time-passwords-test-20130420-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
