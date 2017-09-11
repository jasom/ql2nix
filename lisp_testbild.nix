
{ buildLispPackage, stdenv, fetchurl, lisp-project_testbild, 
   lisp_cl-ppcre, lisp_graylex,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_graylex  ];
      inherit stdenv;
      systemName = "testbild";
      
      sourceProject = "${lisp-project_testbild}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_graylex}";
      name = "lisp_testbild-20101207-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
