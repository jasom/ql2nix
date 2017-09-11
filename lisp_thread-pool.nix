
{ buildLispPackage, stdenv, fetchurl, lisp-project_thread-pool, 
   lisp_arnesi, lisp_bordeaux-threads,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_arnesi lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "thread-pool";
      
      sourceProject = "${lisp-project_thread-pool}";
      patches = [];
      lisp_dependencies = "${lisp_arnesi} ${lisp_bordeaux-threads}";
      name = "lisp_thread-pool-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
