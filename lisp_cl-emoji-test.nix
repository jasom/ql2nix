
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-emoji, 
   lisp_cl-emoji, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-emoji lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-emoji-test";
      
      sourceProject = "${lisp-project_cl-emoji}";
      patches = [];
      lisp_dependencies = "${lisp_cl-emoji} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-emoji-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
