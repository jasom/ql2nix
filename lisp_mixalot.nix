
{ buildLispPackage, stdenv, fetchurl, lisp-project_mixalot, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_cffi  ];
      inherit stdenv;
      systemName = "mixalot";
      
      sourceProject = "${lisp-project_mixalot}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_cffi}";
      name = "lisp_mixalot-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
