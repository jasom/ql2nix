
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-scram, 
   lisp_cl-base64, lisp_cl-sasl, lisp_ironclad, lisp_secure-random, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base64 lisp_cl-sasl lisp_ironclad lisp_secure-random lisp_split-sequence  ];
      inherit stdenv;
      systemName = "cl-scram";
      
      sourceProject = "${lisp-project_cl-scram}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base64} ${lisp_cl-sasl} ${lisp_ironclad} ${lisp_secure-random} ${lisp_split-sequence}";
      name = "lisp_cl-scram-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
