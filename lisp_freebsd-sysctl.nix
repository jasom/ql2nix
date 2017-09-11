
{ buildLispPackage, stdenv, fetchurl, lisp-project_freebsd-sysctl, 
   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi  ];
      inherit stdenv;
      systemName = "freebsd-sysctl";
      
      sourceProject = "${lisp-project_freebsd-sysctl}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_freebsd-sysctl-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
