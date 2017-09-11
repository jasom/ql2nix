
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ply, 
   lisp_cl-ply, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ply lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-ply-test";
      
      sourceProject = "${lisp-project_cl-ply}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ply} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-ply-test-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
