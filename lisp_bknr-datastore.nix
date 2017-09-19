
{ buildLispPackage, stdenv, fetchurl, lisp-project_bknr-datastore, 
   lisp_trivial-utf-8, lisp_yason, lisp_bordeaux-threads, lisp_md5, lisp_unit-test, lisp_alexandria, lisp_closer-mop, lisp_cl-interpol,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-utf-8 lisp_yason lisp_bordeaux-threads lisp_md5 lisp_unit-test lisp_alexandria lisp_closer-mop lisp_cl-interpol  ];
      inherit stdenv;
      systemName = "bknr.datastore";
      
      sourceProject = "${lisp-project_bknr-datastore}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-utf-8} ${lisp_yason} ${lisp_bordeaux-threads} ${lisp_md5} ${lisp_unit-test} ${lisp_alexandria} ${lisp_closer-mop} ${lisp_cl-interpol}";
      name = "lisp_bknr-datastore-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
