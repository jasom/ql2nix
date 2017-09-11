
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_lfarm-admin, lisp_lfarm-client, lisp_lfarm-launcher, lisp_lfarm-server,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lfarm-admin lisp_lfarm-client lisp_lfarm-launcher lisp_lfarm-server  ];
      inherit stdenv;
      systemName = "lfarm-test";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_lfarm-admin} ${lisp_lfarm-client} ${lisp_lfarm-launcher} ${lisp_lfarm-server}";
      name = "lisp_lfarm-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
