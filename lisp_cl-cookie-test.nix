
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cookie, 
   lisp_cl-cookie, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cookie lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-cookie-test";
      
      sourceProject = "${lisp-project_cl-cookie}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cookie} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-cookie-test-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
