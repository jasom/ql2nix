
{ buildLispPackage, stdenv, fetchurl, lisp-project_deploy, 
   lisp_documentation-utils, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_cffi  ];
      inherit stdenv;
      systemName = "deploy";
      
      sourceProject = "${lisp-project_deploy}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_cffi}";
      name = "lisp_deploy-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
