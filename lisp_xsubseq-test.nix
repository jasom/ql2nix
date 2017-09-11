
{ buildLispPackage, stdenv, fetchurl, lisp-project_xsubseq, 
   lisp_prove, lisp_prove-asdf, lisp_xsubseq,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove lisp_prove-asdf lisp_xsubseq  ];
      inherit stdenv;
      systemName = "xsubseq-test";
      
      sourceProject = "${lisp-project_xsubseq}";
      patches = [];
      lisp_dependencies = "${lisp_prove} ${lisp_prove-asdf} ${lisp_xsubseq}";
      name = "lisp_xsubseq-test-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
