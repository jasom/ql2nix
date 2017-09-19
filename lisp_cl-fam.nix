
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fam, 
  fam,   lisp_trivial-garbage, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_cffi-grovel fam ];
      inherit stdenv;
      systemName = "cl-fam";
      
      sourceProject = "${lisp-project_cl-fam}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_cffi-grovel}";
      name = "lisp_cl-fam-20121125-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
