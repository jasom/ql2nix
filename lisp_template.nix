
{ buildLispPackage, stdenv, fetchurl, lisp-project_template, 
   lisp_alexandria, lisp_parameterized-function,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_parameterized-function  ];
      inherit stdenv;
      systemName = "template";
      
      sourceProject = "${lisp-project_template}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_parameterized-function}";
      name = "lisp_template-20150113-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
