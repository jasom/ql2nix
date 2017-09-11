
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-threadpool, 
   lisp_lisp-unit, lisp_bordeaux-threads, lisp_queues-simple-cqueue, lisp_verbose,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lisp-unit lisp_bordeaux-threads lisp_queues-simple-cqueue lisp_verbose  ];
      inherit stdenv;
      systemName = "cl-threadpool-test";
      
      sourceProject = "${lisp-project_cl-threadpool}";
      patches = [];
      lisp_dependencies = "${lisp_lisp-unit} ${lisp_bordeaux-threads} ${lisp_queues-simple-cqueue} ${lisp_verbose}";
      name = "lisp_cl-threadpool-test-quickload-current-release-67b33ca4-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
