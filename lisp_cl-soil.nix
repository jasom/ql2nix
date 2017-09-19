
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-soil, 
   lisp_cl-opengl, lisp_documentation-utils, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-opengl lisp_documentation-utils lisp_cffi  ];
      inherit stdenv;
      systemName = "cl-soil";
      
      sourceProject = "${lisp-project_cl-soil}";
      patches = [];
      lisp_dependencies = "${lisp_cl-opengl} ${lisp_documentation-utils} ${lisp_cffi}";
      name = "lisp_cl-soil-release-quicklisp-69e1213c-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
