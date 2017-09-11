
{ buildLispPackage, stdenv, fetchurl, lisp-project_glsl-toolkit, 
   lisp_documentation-utils, lisp_parse-float, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_parse-float lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "glsl-toolkit";
      
      sourceProject = "${lisp-project_glsl-toolkit}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_parse-float} ${lisp_cl-ppcre}";
      name = "lisp_glsl-toolkit-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
