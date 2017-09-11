
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-main-thread, 
   lisp_trivial-features, lisp_bordeaux-threads, lisp_simple-tasks,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-features lisp_bordeaux-threads lisp_simple-tasks  ];
      inherit stdenv;
      systemName = "trivial-main-thread";
      
      sourceProject = "${lisp-project_trivial-main-thread}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-features} ${lisp_bordeaux-threads} ${lisp_simple-tasks}";
      name = "lisp_trivial-main-thread-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
