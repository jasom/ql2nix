
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-oclapi, 
   lisp_prove-asdf, lisp_cl-oclapi, lisp_prove,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_cl-oclapi lisp_prove  ];
      inherit stdenv;
      systemName = "cl-oclapi-test";
      
      sourceProject = "${lisp-project_cl-oclapi}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_cl-oclapi} ${lisp_prove}";
      name = "lisp_cl-oclapi-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
