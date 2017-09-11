
{ buildLispPackage, stdenv, fetchurl, lisp-project_cffi, 
   lisp_trivial-features, lisp_cffi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-features lisp_cffi  ];
      inherit stdenv;
      systemName = "cffi-tests/example";
      
      sourceProject = "${lisp-project_cffi}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-features} ${lisp_cffi}";
      name = "lisp_cffi-tests-example_0.19.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }