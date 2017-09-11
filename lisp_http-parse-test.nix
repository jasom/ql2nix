
{ buildLispPackage, stdenv, fetchurl, lisp-project_http-parse, 
   lisp_babel, lisp_eos, lisp_http-parse,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_eos lisp_http-parse  ];
      inherit stdenv;
      systemName = "http-parse-test";
      
      sourceProject = "${lisp-project_http-parse}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_eos} ${lisp_http-parse}";
      name = "lisp_http-parse-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
