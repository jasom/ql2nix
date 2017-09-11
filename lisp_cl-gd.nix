
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gd, 
   lisp_uffi, lisp_cffi-uffi-compat,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_uffi lisp_cffi-uffi-compat  ];
      inherit stdenv;
      systemName = "cl-gd";
      
      sourceProject = "${lisp-project_cl-gd}";
      patches = [];
      lisp_dependencies = "${lisp_uffi} ${lisp_cffi-uffi-compat}";
      name = "lisp_cl-gd-0.6.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
