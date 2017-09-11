
{ buildLispPackage, stdenv, fetchurl, lisp-project_random-state, 
   lisp_documentation-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "random-state";
      
      sourceProject = "${lisp-project_random-state}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils}";
      name = "lisp_random-state-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
