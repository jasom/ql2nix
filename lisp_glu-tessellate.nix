
{ buildLispPackage, stdenv, fetchurl, lisp-project_glu-tessellate, 
  mesa_glu,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi mesa_glu ];
      inherit stdenv;
      systemName = "glu-tessellate";
      
      sourceProject = "${lisp-project_glu-tessellate}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_glu-tessellate-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
