
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fond, 
   lisp_cl-opengl, lisp_documentation-utils, lisp_trivial-garbage, lisp_cffi, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-opengl lisp_documentation-utils lisp_trivial-garbage lisp_cffi lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-fond";
      
      sourceProject = "${lisp-project_cl-fond}";
      patches = [];
      lisp_dependencies = "${lisp_cl-opengl} ${lisp_documentation-utils} ${lisp_trivial-garbage} ${lisp_cffi} ${lisp_alexandria}";
      name = "lisp_cl-fond-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
