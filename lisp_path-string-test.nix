
{ buildLispPackage, stdenv, fetchurl, lisp-project_path-string, 
   lisp_path-string, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_path-string lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "path-string-test";
      
      sourceProject = "${lisp-project_path-string}";
      patches = [];
      lisp_dependencies = "${lisp_path-string} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_path-string-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
