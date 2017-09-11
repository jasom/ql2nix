
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-http, 
   lisp_lift, lisp_trivial-http,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_trivial-http  ];
      inherit stdenv;
      systemName = "trivial-http-test";
      
      sourceProject = "${lisp-project_trivial-http}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_trivial-http}";
      name = "lisp_trivial-http-test-20110219-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
