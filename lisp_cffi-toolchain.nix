
{ buildLispPackage, stdenv, fetchurl, lisp-project_cffi, 
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
      systemName = "cffi-toolchain";
      
      sourceProject = "${lisp-project_cffi}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cffi-toolchain_0.19.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
