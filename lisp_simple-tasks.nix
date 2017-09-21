
{ buildLispPackage, stdenv, fetchurl, lisp-project_simple-tasks, 
   lisp_dissect, lisp_array-utils, lisp_bordeaux-threads,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_dissect lisp_array-utils lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "simple-tasks";
      
      sourceProject = "${lisp-project_simple-tasks}";
      patches = [];
      lisp_dependencies = "${lisp_dissect} ${lisp_array-utils} ${lisp_bordeaux-threads}";
      name = "lisp_simple-tasks-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }