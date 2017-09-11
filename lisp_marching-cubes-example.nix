
{ buildLispPackage, stdenv, fetchurl, lisp-project_marching-cubes, 
   lisp_marching-cubes,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_marching-cubes  ];
      inherit stdenv;
      systemName = "marching-cubes-example";
      
      sourceProject = "${lisp-project_marching-cubes}";
      patches = [];
      lisp_dependencies = "${lisp_marching-cubes}";
      name = "lisp_marching-cubes-example-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
