
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-build, 
   lisp_lisp-invocation, lisp_trivial-exe,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lisp-invocation lisp_trivial-exe  ];
      inherit stdenv;
      systemName = "trivial-build";
      
      sourceProject = "${lisp-project_trivial-build}";
      patches = [];
      lisp_dependencies = "${lisp_lisp-invocation} ${lisp_trivial-exe}";
      name = "lisp_trivial-build-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
