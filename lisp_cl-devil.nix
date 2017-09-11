
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-devil, 
  libdevil,   lisp_alexandria, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi libdevil ];
      inherit stdenv;
      systemName = "cl-devil";
      
      sourceProject = "${lisp-project_cl-devil}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi}";
      name = "lisp_cl-devil-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
