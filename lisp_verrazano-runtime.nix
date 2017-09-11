
{ buildLispPackage, stdenv, fetchurl, lisp-project_verrazano, 
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
      systemName = "verrazano-runtime";
      
      sourceProject = "${lisp-project_verrazano}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_verrazano-runtime-20120909-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
