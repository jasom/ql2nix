
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mysql, 
  libmysql,   lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi libmysql ];
      inherit stdenv;
      systemName = "cl-mysql";
      
      sourceProject = "${lisp-project_cl-mysql}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-mysql-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
