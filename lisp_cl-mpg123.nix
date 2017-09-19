
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mpg123, 
   lisp_documentation-utils, lisp_trivial-garbage, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_trivial-garbage lisp_cffi  ];
      inherit stdenv;
      systemName = "cl-mpg123";
      
      sourceProject = "${lisp-project_cl-mpg123}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_trivial-garbage} ${lisp_cffi}";
      name = "lisp_cl-mpg123-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
