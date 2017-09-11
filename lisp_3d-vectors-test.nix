
{ buildLispPackage, stdenv, fetchurl, lisp-project_3d-vectors, 
   lisp_3d-vectors, lisp_parachute,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_3d-vectors lisp_parachute  ];
      inherit stdenv;
      systemName = "3d-vectors-test";
      
      sourceProject = "${lisp-project_3d-vectors}";
      patches = [];
      lisp_dependencies = "${lisp_3d-vectors} ${lisp_parachute}";
      name = "lisp_3d-vectors-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
