
{ buildLispPackage, stdenv, fetchurl, lisp-project_cffi, 
   lisp_babel, lisp_alexandria, lisp_trivial-features,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_alexandria lisp_trivial-features  ];
      inherit stdenv;
      systemName = "cffi-tests/example";
      
      sourceProject = "${lisp-project_cffi}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_alexandria} ${lisp_trivial-features}";
      name = "lisp_cffi-tests-example_0.19.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
