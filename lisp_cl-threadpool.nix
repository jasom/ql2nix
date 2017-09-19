
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-threadpool, 
   lisp_verbose, lisp_queues-simple-cqueue, lisp_bordeaux-threads,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_verbose lisp_queues-simple-cqueue lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "cl-threadpool";
      
      sourceProject = "${lisp-project_cl-threadpool}";
      patches = [];
      lisp_dependencies = "${lisp_verbose} ${lisp_queues-simple-cqueue} ${lisp_bordeaux-threads}";
      name = "lisp_cl-threadpool-quickload-current-release-67b33ca4-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
