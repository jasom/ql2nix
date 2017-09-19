
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
  hdf5,   lisp_cffi, lisp_split-sequence, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_split-sequence lisp_alexandria hdf5 ];
      inherit stdenv;
      systemName = "cl-ana.hdf-table";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_cl-ana-hdf-table-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
