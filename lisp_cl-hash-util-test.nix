
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hash-util, 
   lisp_cl-hash-util, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-hash-util lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-hash-util-test";
      
      sourceProject = "${lisp-project_cl-hash-util}";
      patches = [];
      lisp_dependencies = "${lisp_cl-hash-util} ${lisp_fiveam}";
      name = "lisp_cl-hash-util-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
