
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_alexandria, lisp_cl-base64, lisp_lack, lisp_lack-middleware-auth-basic, lisp_lack-test, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-base64 lisp_lack lisp_lack-middleware-auth-basic lisp_lack-test lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-lack-middleware-auth-basic";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-base64} ${lisp_lack} ${lisp_lack-middleware-auth-basic} ${lisp_lack-test} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_t-lack-middleware-auth-basic-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
