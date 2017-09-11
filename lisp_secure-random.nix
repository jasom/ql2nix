
{ buildLispPackage, stdenv, fetchurl, lisp-project_secure-random, 
   lisp_cl-ssl,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl  ];
      inherit stdenv;
      systemName = "secure-random";
      
      sourceProject = "${lisp-project_secure-random}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl}";
      name = "lisp_secure-random-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
