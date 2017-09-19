
{ buildLispPackage, stdenv, fetchurl, lisp-project_glsl-toolkit, 
   lisp_cl-ppcre, lisp_parse-float, lisp_documentation-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_parse-float lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "glsl-toolkit";
      
      sourceProject = "${lisp-project_glsl-toolkit}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_parse-float} ${lisp_documentation-utils}";
      name = "lisp_glsl-toolkit-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
