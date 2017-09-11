
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cut, 
   lisp_cl-cut, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cut lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-cut.test";
      
      sourceProject = "${lisp-project_cl-cut}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cut} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-cut-test-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
