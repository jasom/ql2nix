
{ buildLispPackage, stdenv, fetchurl, lisp-project_time-interval, 
   lisp_cl-ppcre, lisp_local-time,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_local-time  ];
      inherit stdenv;
      systemName = "time-interval";
      
      sourceProject = "${lisp-project_time-interval}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_local-time}";
      name = "lisp_time-interval-20120520-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
