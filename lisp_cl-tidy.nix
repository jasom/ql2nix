
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-tidy, 
  html-tidy,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi html-tidy ];
      inherit stdenv;
      systemName = "cl-tidy";
      
      sourceProject = "${lisp-project_cl-tidy}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-tidy-20131111-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
