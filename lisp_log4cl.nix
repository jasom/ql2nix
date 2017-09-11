
{ buildLispPackage, stdenv, fetchurl, lisp-project_log4cl, 
   lisp_bordeaux-threads, lisp_bt-semaphore,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_bt-semaphore  ];
      inherit stdenv;
      systemName = "log4cl";
      
      sourceProject = "${lisp-project_log4cl}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_bt-semaphore}";
      name = "lisp_log4cl-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }