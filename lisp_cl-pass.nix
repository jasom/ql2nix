
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-pass, 
   lisp_ironclad, lisp_trivial-utf-8, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_trivial-utf-8 lisp_split-sequence  ];
      inherit stdenv;
      systemName = "cl-pass";
      
      sourceProject = "${lisp-project_cl-pass}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_trivial-utf-8} ${lisp_split-sequence}";
      name = "lisp_cl-pass-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
