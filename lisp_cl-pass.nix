
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-pass, 
   lisp_split-sequence, lisp_trivial-utf-8, lisp_ironclad,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_trivial-utf-8 lisp_ironclad  ];
      inherit stdenv;
      systemName = "cl-pass";
      
      sourceProject = "${lisp-project_cl-pass}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_trivial-utf-8} ${lisp_ironclad}";
      name = "lisp_cl-pass-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
