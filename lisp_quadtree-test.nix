
{ buildLispPackage, stdenv, fetchurl, lisp-project_quadtree, 
   lisp_prove, lisp_prove-asdf, lisp_quadtree,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove lisp_prove-asdf lisp_quadtree  ];
      inherit stdenv;
      systemName = "quadtree-test";
      
      sourceProject = "${lisp-project_quadtree}";
      patches = [];
      lisp_dependencies = "${lisp_prove} ${lisp_prove-asdf} ${lisp_quadtree}";
      name = "lisp_quadtree-test-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
