
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-scram, 
   lisp_split-sequence, lisp_secure-random, lisp_cl-base64, lisp_cl-sasl,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_secure-random lisp_cl-base64 lisp_cl-sasl  ];
      inherit stdenv;
      systemName = "cl-scram";
      
      sourceProject = "${lisp-project_cl-scram}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_secure-random} ${lisp_cl-base64} ${lisp_cl-sasl}";
      name = "lisp_cl-scram-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
