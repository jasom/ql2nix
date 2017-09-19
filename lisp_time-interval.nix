
{ buildLispPackage, stdenv, fetchurl, lisp-project_time-interval, 
   lisp_local-time, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "time-interval";
      
      sourceProject = "${lisp-project_time-interval}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_cl-ppcre}";
      name = "lisp_time-interval-20120520-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
