
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mpg123, 
   lisp_cffi, lisp_trivial-garbage, lisp_documentation-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_trivial-garbage lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "cl-mpg123";
      
      sourceProject = "${lisp-project_cl-mpg123}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_trivial-garbage} ${lisp_documentation-utils}";
      name = "lisp_cl-mpg123-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
