
{ buildLispPackage, stdenv, fetchurl, lisp-project_quri, 
   lisp_alexandria, lisp_babel, lisp_cl-utilities, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_babel lisp_cl-utilities lisp_split-sequence  ];
      inherit stdenv;
      systemName = "quri";
      
      sourceProject = "${lisp-project_quri}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_babel} ${lisp_cl-utilities} ${lisp_split-sequence}";
      name = "lisp_quri-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
