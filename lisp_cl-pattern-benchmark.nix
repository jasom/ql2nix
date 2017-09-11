
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-pattern, 
   lisp_cl-pattern,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-pattern  ];
      inherit stdenv;
      systemName = "cl-pattern-benchmark";
      
      sourceProject = "${lisp-project_cl-pattern}";
      patches = [];
      lisp_dependencies = "${lisp_cl-pattern}";
      name = "lisp_cl-pattern-benchmark-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
