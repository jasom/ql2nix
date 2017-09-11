
{ buildLispPackage, stdenv, fetchurl, lisp-project_lev, 
  libev,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi libev ];
      inherit stdenv;
      systemName = "lev";
      
      sourceProject = "${lisp-project_lev}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_lev-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
