
{ buildLispPackage, stdenv, fetchurl, lisp-project_antik, 
   lisp_antik-base, lisp_cffi, lisp_cffi-grovel, lisp_static-vectors, lisp_trivial-garbage,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_antik-base lisp_cffi lisp_cffi-grovel lisp_static-vectors lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "foreign-array";
      
      sourceProject = "${lisp-project_antik}";
      patches = [];
      lisp_dependencies = "${lisp_antik-base} ${lisp_cffi} ${lisp_cffi-grovel} ${lisp_static-vectors} ${lisp_trivial-garbage}";
      name = "lisp_foreign-array-master-ad6432e3-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
