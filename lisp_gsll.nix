
{ buildLispPackage, stdenv, fetchurl, lisp-project_gsll, 
  gsl,   lisp_foreign-array, lisp_cffi-libffi,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_foreign-array lisp_cffi-libffi gsl ];
      inherit stdenv;
      systemName = "gsll";
      
      sourceProject = "${lisp-project_gsll}";
      patches = [];
      lisp_dependencies = "${lisp_foreign-array} ${lisp_cffi-libffi}";
      name = "lisp_gsll-quicklisp-dd2e7673-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
