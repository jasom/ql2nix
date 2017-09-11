
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gss, 
  kerberos,   lisp_cffi-grovel, lisp_trivial-garbage, lisp_trivial-utf-8,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-grovel lisp_trivial-garbage lisp_trivial-utf-8 kerberos ];
      inherit stdenv;
      systemName = "cl-gss";
      
      sourceProject = "${lisp-project_cl-gss}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-grovel} ${lisp_trivial-garbage} ${lisp_trivial-utf-8}";
      name = "lisp_cl-gss-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
