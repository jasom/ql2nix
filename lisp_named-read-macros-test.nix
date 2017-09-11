
{ buildLispPackage, stdenv, fetchurl, lisp-project_named-read-macros, 
   lisp_fiveam, lisp_named-read-macros,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_named-read-macros  ];
      inherit stdenv;
      systemName = "named-read-macros-test";
      
      sourceProject = "${lisp-project_named-read-macros}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_named-read-macros}";
      name = "lisp_named-read-macros-test-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
