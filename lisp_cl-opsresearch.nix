
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-opsresearch, 
   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi  ];
      inherit stdenv;
      systemName = "cl-opsresearch";
      
      sourceProject = "${lisp-project_cl-opsresearch}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-opsresearch-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
