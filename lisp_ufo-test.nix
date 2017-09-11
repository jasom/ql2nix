
{ buildLispPackage, stdenv, fetchurl, lisp-project_ufo, 
   lisp_cl-fad, lisp_prove, lisp_prove-asdf, lisp_ufo,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_prove lisp_prove-asdf lisp_ufo  ];
      inherit stdenv;
      systemName = "ufo-test";
      
      sourceProject = "${lisp-project_ufo}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_prove} ${lisp_prove-asdf} ${lisp_ufo}";
      name = "lisp_ufo-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
