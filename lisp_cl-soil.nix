
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-soil, 
   lisp_cffi, lisp_documentation-utils, lisp_cl-opengl,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_documentation-utils lisp_cl-opengl  ];
      inherit stdenv;
      systemName = "cl-soil";
      
      sourceProject = "${lisp-project_cl-soil}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_documentation-utils} ${lisp_cl-opengl}";
      name = "lisp_cl-soil-release-quicklisp-69e1213c-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
