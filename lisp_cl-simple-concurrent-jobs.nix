
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-simple-concurrent-jobs, 
   lisp_chanl, lisp_bordeaux-threads,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_chanl lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "cl-simple-concurrent-jobs";
      
      sourceProject = "${lisp-project_cl-simple-concurrent-jobs}";
      patches = [];
      lisp_dependencies = "${lisp_chanl} ${lisp_bordeaux-threads}";
      name = "lisp_cl-simple-concurrent-jobs-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
