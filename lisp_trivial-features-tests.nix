
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-features, 
   lisp_alexandria, lisp_cffi, lisp_cffi-grovel, lisp_rt, lisp_trivial-features,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cffi-grovel lisp_rt lisp_trivial-features  ];
      inherit stdenv;
      systemName = "trivial-features-tests";
      
      sourceProject = "${lisp-project_trivial-features}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cffi-grovel} ${lisp_rt} ${lisp_trivial-features}";
      name = "lisp_trivial-features-tests-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
