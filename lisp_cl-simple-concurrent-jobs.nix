
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-simple-concurrent-jobs, 
   lisp_bordeaux-threads, lisp_chanl,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_chanl  ];
      inherit stdenv;
      systemName = "cl-simple-concurrent-jobs";
      
      sourceProject = "${lisp-project_cl-simple-concurrent-jobs}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_chanl}";
      name = "lisp_cl-simple-concurrent-jobs-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
