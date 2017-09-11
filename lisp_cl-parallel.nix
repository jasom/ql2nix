
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-parallel, 
   lisp_bordeaux-threads,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "cl-parallel";
      
      sourceProject = "${lisp-project_cl-parallel}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads}";
      name = "lisp_cl-parallel-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
