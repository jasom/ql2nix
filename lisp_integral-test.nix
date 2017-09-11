
{ buildLispPackage, stdenv, fetchurl, lisp-project_integral, 
   lisp_integral, lisp_local-time, lisp_prove, lisp_prove-asdf, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_integral lisp_local-time lisp_prove lisp_prove-asdf lisp_split-sequence  ];
      inherit stdenv;
      systemName = "integral-test";
      
      sourceProject = "${lisp-project_integral}";
      patches = [];
      lisp_dependencies = "${lisp_integral} ${lisp_local-time} ${lisp_prove} ${lisp_prove-asdf} ${lisp_split-sequence}";
      name = "lisp_integral-test-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
