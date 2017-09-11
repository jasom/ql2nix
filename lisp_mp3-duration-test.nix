
{ buildLispPackage, stdenv, fetchurl, lisp-project_mp3-duration, 
   lisp_mp3-duration, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mp3-duration lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "mp3-duration-test";
      
      sourceProject = "${lisp-project_mp3-duration}";
      patches = [];
      lisp_dependencies = "${lisp_mp3-duration} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_mp3-duration-test-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
