
{ buildLispPackage, stdenv, fetchurl, lisp-project_arnesi, 
   lisp_collectors, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_collectors lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "arnesi/cl-ppcre-extras";
      
      sourceProject = "${lisp-project_arnesi}";
      patches = [];
      lisp_dependencies = "${lisp_collectors} ${lisp_cl-ppcre}";
      name = "lisp_arnesi-cl-ppcre-extras-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
