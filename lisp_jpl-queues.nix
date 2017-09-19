
{ buildLispPackage, stdenv, fetchurl, lisp-project_jpl-queues, 
   lisp_jpl-util, lisp_bordeaux-threads,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_jpl-util lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "jpl-queues";
      
      sourceProject = "${lisp-project_jpl-queues}";
      patches = [];
      lisp_dependencies = "${lisp_jpl-util} ${lisp_bordeaux-threads}";
      name = "lisp_jpl-queues-0.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
