
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
  hdf5,   lisp_split-sequence, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_cffi hdf5 ];
      inherit stdenv;
      systemName = "cl-ana.hdf-utils";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_cffi}";
      name = "lisp_cl-ana-hdf-utils-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
