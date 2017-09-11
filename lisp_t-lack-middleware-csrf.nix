
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_cl-ppcre, lisp_lack, lisp_lack-middleware-csrf, lisp_lack-request, lisp_lack-test, lisp_prove, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_lack lisp_lack-middleware-csrf lisp_lack-request lisp_lack-test lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-lack-middleware-csrf";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_lack} ${lisp_lack-middleware-csrf} ${lisp_lack-request} ${lisp_lack-test} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_t-lack-middleware-csrf-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
