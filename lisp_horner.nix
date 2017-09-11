
{ buildLispPackage, stdenv, fetchurl, lisp-project_horner, 
   lisp_alexandria, lisp_serapeum, lisp_infix-math,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_serapeum lisp_infix-math  ];
      inherit stdenv;
      systemName = "horner";
      
      sourceProject = "${lisp-project_horner}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_serapeum} ${lisp_infix-math}";
      name = "lisp_horner-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
