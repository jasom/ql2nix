
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_lfarm-common, lisp_lparallel, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lfarm-common lisp_lparallel lisp_usocket  ];
      inherit stdenv;
      systemName = "lfarm-client";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_lfarm-common} ${lisp_lparallel} ${lisp_usocket}";
      name = "lisp_lfarm-client-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
