
{ buildLispPackage, stdenv, fetchurl, lisp-project_linewise-template, 
   lisp_cl-fad, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "linewise-template";
      
      sourceProject = "${lisp-project_linewise-template}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_cl-ppcre}";
      name = "lisp_linewise-template-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
