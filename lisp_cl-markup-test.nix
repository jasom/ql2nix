
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-markup, 
   lisp_cl-markup, lisp_cl-test-more,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-markup lisp_cl-test-more  ];
      inherit stdenv;
      systemName = "cl-markup-test";
      
      sourceProject = "${lisp-project_cl-markup}";
      patches = [];
      lisp_dependencies = "${lisp_cl-markup} ${lisp_cl-test-more}";
      name = "lisp_cl-markup-test-20131003-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
