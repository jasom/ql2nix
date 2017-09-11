
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-jsx, 
   lisp_cl-jsx, lisp_prove, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-jsx lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-jsx-test";
      
      sourceProject = "${lisp-project_cl-jsx}";
      patches = [];
      lisp_dependencies = "${lisp_cl-jsx} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-jsx-test-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
