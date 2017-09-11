
{ buildLispPackage, stdenv, fetchurl, lisp-project_inner-conditional, 
   lisp_cl-test-more, lisp_inner-conditional,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-test-more lisp_inner-conditional  ];
      inherit stdenv;
      systemName = "inner-conditional-test";
      
      sourceProject = "${lisp-project_inner-conditional}";
      patches = [];
      lisp_dependencies = "${lisp_cl-test-more} ${lisp_inner-conditional}";
      name = "lisp_inner-conditional-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
