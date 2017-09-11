
{ buildLispPackage, stdenv, fetchurl, lisp-project_simple-tasks, 
   lisp_bordeaux-threads, lisp_array-utils, lisp_dissect,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_array-utils lisp_dissect  ];
      inherit stdenv;
      systemName = "simple-tasks";
      
      sourceProject = "${lisp-project_simple-tasks}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_array-utils} ${lisp_dissect}";
      name = "lisp_simple-tasks-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
