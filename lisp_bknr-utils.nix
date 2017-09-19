
{ buildLispPackage, stdenv, fetchurl, lisp-project_bknr-datastore, 
   lisp_bordeaux-threads, lisp_alexandria, lisp_md5, lisp_cl-interpol,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_alexandria lisp_md5 lisp_cl-interpol  ];
      inherit stdenv;
      systemName = "bknr.utils";
      
      sourceProject = "${lisp-project_bknr-datastore}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_alexandria} ${lisp_md5} ${lisp_cl-interpol}";
      name = "lisp_bknr-utils-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
