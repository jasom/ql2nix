
{ buildLispPackage, stdenv, fetchurl, lisp-project_queues, 
   lisp_queues,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_queues  ];
      inherit stdenv;
      systemName = "queues.simple-queue";
      
      sourceProject = "${lisp-project_queues}";
      patches = [];
      lisp_dependencies = "${lisp_queues}";
      name = "lisp_queues-simple-queue-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
