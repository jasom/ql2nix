
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
  hdf5,   lisp_gsll, lisp_closer-mop, lisp_iterate, lisp_split-sequence, lisp_cffi, lisp_alexandria,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_gsll lisp_closer-mop lisp_iterate lisp_split-sequence lisp_cffi lisp_alexandria hdf5 ];
      inherit stdenv;
      systemName = "cl-ana.serialization";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_gsll} ${lisp_closer-mop} ${lisp_iterate} ${lisp_split-sequence} ${lisp_cffi} ${lisp_alexandria}";
      name = "lisp_cl-ana-serialization-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
