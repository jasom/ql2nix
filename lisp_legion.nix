
{ buildLispPackage, stdenv, fetchurl, lisp-project_legion, 
   lisp_vom, lisp_bordeaux-threads, lisp_cl-speedy-queue,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_vom lisp_bordeaux-threads lisp_cl-speedy-queue  ];
      inherit stdenv;
      systemName = "legion";
      
      sourceProject = "${lisp-project_legion}";
      patches = [];
      lisp_dependencies = "${lisp_vom} ${lisp_bordeaux-threads} ${lisp_cl-speedy-queue}";
      name = "lisp_legion-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
