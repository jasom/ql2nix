
{ buildLispPackage, stdenv, fetchurl, lisp-project_global-vars, 
   lisp_global-vars,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_global-vars  ];
      inherit stdenv;
      systemName = "global-vars-test";
      
      sourceProject = "${lisp-project_global-vars}";
      patches = [];
      lisp_dependencies = "${lisp_global-vars}";
      name = "lisp_global-vars-test-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
