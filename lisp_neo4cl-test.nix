
{ buildLispPackage, stdenv, fetchurl, lisp-project_neo4cl, 
   lisp_neo4cl, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_neo4cl lisp_fiveam  ];
      inherit stdenv;
      systemName = "neo4cl-test";
      
      sourceProject = "${lisp-project_neo4cl}";
      patches = [];
      lisp_dependencies = "${lisp_neo4cl} ${lisp_fiveam}";
      name = "lisp_neo4cl-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
