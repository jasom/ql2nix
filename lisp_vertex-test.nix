
{ buildLispPackage, stdenv, fetchurl, lisp-project_vertex, 
   lisp_fiveam, lisp_vertex,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_vertex  ];
      inherit stdenv;
      systemName = "vertex-test";
      
      sourceProject = "${lisp-project_vertex}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_vertex}";
      name = "lisp_vertex-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
