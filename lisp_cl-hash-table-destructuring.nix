
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hash-table-destructuring, 
   lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-hash-table-destructuring";
      
      sourceProject = "${lisp-project_cl-hash-table-destructuring}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf}";
      name = "lisp_cl-hash-table-destructuring-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
