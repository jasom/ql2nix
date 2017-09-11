
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-coroutine, 
   lisp_cl-coroutine, lisp_cl-test-more,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-coroutine lisp_cl-test-more  ];
      inherit stdenv;
      systemName = "cl-coroutine-test";
      
      sourceProject = "${lisp-project_cl-coroutine}";
      patches = [];
      lisp_dependencies = "${lisp_cl-coroutine} ${lisp_cl-test-more}";
      name = "lisp_cl-coroutine-test-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
