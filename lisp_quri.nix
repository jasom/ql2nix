
{ buildLispPackage, stdenv, fetchurl, lisp-project_quri, 
   lisp_cl-utilities, lisp_split-sequence, lisp_babel,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-utilities lisp_split-sequence lisp_babel  ];
      inherit stdenv;
      systemName = "quri";
      
      sourceProject = "${lisp-project_quri}";
      patches = [];
      lisp_dependencies = "${lisp_cl-utilities} ${lisp_split-sequence} ${lisp_babel}";
      name = "lisp_quri-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
