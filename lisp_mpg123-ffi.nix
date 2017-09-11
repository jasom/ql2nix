
{ buildLispPackage, stdenv, fetchurl, lisp-project_mixalot, 
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
      systemName = "mpg123-ffi";
      
      sourceProject = "${lisp-project_mixalot}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_mpg123-ffi-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
