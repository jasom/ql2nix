
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_external-program, lisp_lfarm-admin, lisp_lfarm-server,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_external-program lisp_lfarm-admin lisp_lfarm-server  ];
      inherit stdenv;
      systemName = "lfarm-launcher";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_external-program} ${lisp_lfarm-admin} ${lisp_lfarm-server}";
      name = "lisp_lfarm-launcher-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
