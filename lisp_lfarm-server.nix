
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_lfarm-common, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lfarm-common lisp_usocket  ];
      inherit stdenv;
      systemName = "lfarm-server";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_lfarm-common} ${lisp_usocket}";
      name = "lisp_lfarm-server-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
