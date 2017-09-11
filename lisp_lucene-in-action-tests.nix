
{ buildLispPackage, stdenv, fetchurl, lisp-project_montezuma, 
   lisp_montezuma, lisp_lift,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_montezuma lisp_lift  ];
      inherit stdenv;
      systemName = "lucene-in-action-tests";
      
      sourceProject = "${lisp-project_montezuma}";
      patches = [];
      lisp_dependencies = "${lisp_montezuma} ${lisp_lift}";
      name = "lisp_lucene-in-action-tests-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
