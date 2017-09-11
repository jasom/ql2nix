
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fam, 
  fam,   lisp_cffi, lisp_cffi-grovel, lisp_trivial-garbage,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cffi-grovel lisp_trivial-garbage fam ];
      inherit stdenv;
      systemName = "cl-fam";
      
      sourceProject = "${lisp-project_cl-fam}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cffi-grovel} ${lisp_trivial-garbage}";
      name = "lisp_cl-fam-20121125-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
