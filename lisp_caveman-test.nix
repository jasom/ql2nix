
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman, 
   lisp_cl-test-more, lisp_caveman,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-test-more lisp_caveman  ];
      inherit stdenv;
      systemName = "caveman-test";
      
      sourceProject = "${lisp-project_caveman}";
      patches = [];
      lisp_dependencies = "${lisp_cl-test-more} ${lisp_caveman}";
      name = "lisp_caveman-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
