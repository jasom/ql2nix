
{ buildLispPackage, stdenv, fetchurl, lisp-project_simple-date-time, 
   lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "simple-date-time";
      
      sourceProject = "${lisp-project_simple-date-time}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre}";
      name = "lisp_simple-date-time-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
