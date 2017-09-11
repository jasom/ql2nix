
{ buildLispPackage, stdenv, fetchurl, lisp-project_queues, 
   lisp_bordeaux-threads, lisp_queues, lisp_queues-priority-queue,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_queues lisp_queues-priority-queue  ];
      inherit stdenv;
      systemName = "queues.priority-cqueue";
      
      sourceProject = "${lisp-project_queues}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_queues} ${lisp_queues-priority-queue}";
      name = "lisp_queues-priority-cqueue-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
