
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-critic, 
   lisp_ckr-tables,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ckr-tables  ];
      inherit stdenv;
      systemName = "lisp-critic";
      
      sourceProject = "${lisp-project_lisp-critic}";
      patches = [];
      lisp_dependencies = "${lisp_ckr-tables}";
      name = "lisp_lisp-critic-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
