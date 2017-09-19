
{ buildLispPackage, stdenv, fetchurl, lisp-project_log4cl, 
   lisp_swank, lisp_bt-semaphore, lisp_bordeaux-threads,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_swank lisp_bt-semaphore lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "log4cl-examples";
      
      sourceProject = "${lisp-project_log4cl}";
      patches = [];
      lisp_dependencies = "${lisp_swank} ${lisp_bt-semaphore} ${lisp_bordeaux-threads}";
      name = "lisp_log4cl-examples-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
