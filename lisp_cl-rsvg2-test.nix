
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rsvg2, 
   lisp_cffi, lisp_cl-rsvg2, lisp_eos,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-rsvg2 lisp_eos  ];
      inherit stdenv;
      systemName = "cl-rsvg2-test";
      
      sourceProject = "${lisp-project_cl-rsvg2}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-rsvg2} ${lisp_eos}";
      name = "lisp_cl-rsvg2-test-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
