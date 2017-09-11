
{ buildLispPackage, stdenv, fetchurl, lisp-project_floating-point, 
   lisp_floating-point, lisp_lisp-unit,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_floating-point lisp_lisp-unit  ];
      inherit stdenv;
      systemName = "floating-point-test";
      
      sourceProject = "${lisp-project_floating-point}";
      patches = [];
      lisp_dependencies = "${lisp_floating-point} ${lisp_lisp-unit}";
      name = "lisp_floating-point-test-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
