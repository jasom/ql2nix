
{ buildLispPackage, stdenv, fetchurl, lisp-project_marching-cubes, 
   lisp_cl-test-more, lisp_marching-cubes,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-test-more lisp_marching-cubes  ];
      inherit stdenv;
      systemName = "marching-cubes-test";
      
      sourceProject = "${lisp-project_marching-cubes}";
      patches = [];
      lisp_dependencies = "${lisp_cl-test-more} ${lisp_marching-cubes}";
      name = "lisp_marching-cubes-test-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
