
{ buildLispPackage, stdenv, fetchurl, lisp-project_3d-matrices, 
   lisp_3d-matrices, lisp_parachute,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_3d-matrices lisp_parachute  ];
      inherit stdenv;
      systemName = "3d-matrices-test";
      
      sourceProject = "${lisp-project_3d-matrices}";
      patches = [];
      lisp_dependencies = "${lisp_3d-matrices} ${lisp_parachute}";
      name = "lisp_3d-matrices-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
