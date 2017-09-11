
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_clack, lisp_prove, lisp_usocket, lisp_dexador, lisp_http-body,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clack lisp_prove lisp_usocket lisp_dexador lisp_http-body  ];
      inherit stdenv;
      systemName = "clack-test";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_clack} ${lisp_prove} ${lisp_usocket} ${lisp_dexador} ${lisp_http-body}";
      name = "lisp_clack-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
