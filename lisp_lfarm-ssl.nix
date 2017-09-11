
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_cl-ssl, lisp_lfarm-common,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl lisp_lfarm-common  ];
      inherit stdenv;
      systemName = "lfarm-ssl";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl} ${lisp_lfarm-common}";
      name = "lisp_lfarm-ssl-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
