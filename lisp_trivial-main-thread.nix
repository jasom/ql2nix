
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-main-thread, 
   lisp_simple-tasks, lisp_bordeaux-threads, lisp_trivial-features,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_simple-tasks lisp_bordeaux-threads lisp_trivial-features  ];
      inherit stdenv;
      systemName = "trivial-main-thread";
      
      sourceProject = "${lisp-project_trivial-main-thread}";
      patches = [];
      lisp_dependencies = "${lisp_simple-tasks} ${lisp_bordeaux-threads} ${lisp_trivial-features}";
      name = "lisp_trivial-main-thread-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
