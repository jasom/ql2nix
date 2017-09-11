
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fbclient, 
  firebird,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi firebird ];
      inherit stdenv;
      systemName = "cl-fbclient";
      
      sourceProject = "${lisp-project_cl-fbclient}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-fbclient-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
