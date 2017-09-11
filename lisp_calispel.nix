
{ buildLispPackage, stdenv, fetchurl, lisp-project_calispel, 
   lisp_bordeaux-threads, lisp_jpl-queues, lisp_jpl-util,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_jpl-queues lisp_jpl-util  ];
      inherit stdenv;
      systemName = "calispel";
      
      sourceProject = "${lisp-project_calispel}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_jpl-queues} ${lisp_jpl-util}";
      name = "lisp_calispel-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
