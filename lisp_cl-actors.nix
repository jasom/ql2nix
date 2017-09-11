
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-lisp-actors, 
   lisp_bordeaux-threads,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "cl-actors";
      
      sourceProject = "${lisp-project_common-lisp-actors}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads}";
      name = "lisp_cl-actors-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
