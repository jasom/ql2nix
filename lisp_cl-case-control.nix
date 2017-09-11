
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-case-control, 
   lisp_trivial-types,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-types  ];
      inherit stdenv;
      systemName = "cl-case-control";
      
      sourceProject = "${lisp-project_cl-case-control}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-types}";
      name = "lisp_cl-case-control-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
