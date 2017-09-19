
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mixed, 
   lisp_documentation-utils, lisp_trivial-garbage, lisp_cffi, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_trivial-garbage lisp_cffi lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-mixed";
      
      sourceProject = "${lisp-project_cl-mixed}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_trivial-garbage} ${lisp_cffi} ${lisp_alexandria}";
      name = "lisp_cl-mixed-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
