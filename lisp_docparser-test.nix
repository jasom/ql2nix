
{ buildLispPackage, stdenv, fetchurl, lisp-project_docparser, 
   lisp_docparser, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_docparser lisp_fiveam  ];
      inherit stdenv;
      systemName = "docparser-test";
      
      sourceProject = "${lisp-project_docparser}";
      patches = [];
      lisp_dependencies = "${lisp_docparser} ${lisp_fiveam}";
      name = "lisp_docparser-test-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
