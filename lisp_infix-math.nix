
{ buildLispPackage, stdenv, fetchurl, lisp-project_infix-math, 
   lisp_wu-decimal, lisp_serapeum, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_wu-decimal lisp_serapeum lisp_alexandria  ];
      inherit stdenv;
      systemName = "infix-math";
      
      sourceProject = "${lisp-project_infix-math}";
      patches = [];
      lisp_dependencies = "${lisp_wu-decimal} ${lisp_serapeum} ${lisp_alexandria}";
      name = "lisp_infix-math-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
