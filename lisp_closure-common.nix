
{ buildLispPackage, stdenv, fetchurl, lisp-project_closure-common, 
   lisp_babel, lisp_trivial-gray-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "closure-common";
      
      sourceProject = "${lisp-project_closure-common}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_trivial-gray-streams}";
      name = "lisp_closure-common-20101107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
