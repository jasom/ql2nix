
{ buildLispPackage, stdenv, fetchurl, lisp-project_sanitized-params, 
   lisp_prove, lisp_prove-asdf, lisp_sanitized-params,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove lisp_prove-asdf lisp_sanitized-params  ];
      inherit stdenv;
      systemName = "sanitized-params-test";
      
      sourceProject = "${lisp-project_sanitized-params}";
      patches = [];
      lisp_dependencies = "${lisp_prove} ${lisp_prove-asdf} ${lisp_sanitized-params}";
      name = "lisp_sanitized-params-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
