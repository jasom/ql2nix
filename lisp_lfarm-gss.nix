
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_cl-gss, lisp_lfarm-common, lisp_trivial-gray-streams,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gss lisp_lfarm-common lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "lfarm-gss";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gss} ${lisp_lfarm-common} ${lisp_trivial-gray-streams}";
      name = "lisp_lfarm-gss-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
