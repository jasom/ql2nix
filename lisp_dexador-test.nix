
{ buildLispPackage, stdenv, fetchurl, lisp-project_dexador, 
   lisp_babel, lisp_cl-cookie, lisp_clack-test, lisp_dexador, lisp_lack-request, lisp_prove, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-cookie lisp_clack-test lisp_dexador lisp_lack-request lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "dexador-test";
      
      sourceProject = "${lisp-project_dexador}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-cookie} ${lisp_clack-test} ${lisp_dexador} ${lisp_lack-request} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_dexador-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
