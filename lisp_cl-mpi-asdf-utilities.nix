
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mpi, 
   lisp_cffi-grovel,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "cl-mpi-asdf-utilities";
      
      sourceProject = "${lisp-project_cl-mpi}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-grovel}";
      name = "lisp_cl-mpi-asdf-utilities-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
