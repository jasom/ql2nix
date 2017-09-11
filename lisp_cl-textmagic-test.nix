
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-textmagic, 
   lisp_cl-textmagic, lisp_prove, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-textmagic lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-textmagic-test";
      
      sourceProject = "${lisp-project_cl-textmagic}";
      patches = [];
      lisp_dependencies = "${lisp_cl-textmagic} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-textmagic-test-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
