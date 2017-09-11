
{ buildLispPackage, stdenv, fetchurl, lisp-project_fmt, 
   lisp_fiveam, lisp_fmt,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_fmt  ];
      inherit stdenv;
      systemName = "fmt-test";
      
      sourceProject = "${lisp-project_fmt}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_fmt}";
      name = "lisp_fmt-test-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
