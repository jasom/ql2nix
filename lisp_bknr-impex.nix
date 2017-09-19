
{ buildLispPackage, stdenv, fetchurl, lisp-project_bknr-datastore, 
   lisp_bordeaux-threads, lisp_md5, lisp_closer-mop, lisp_cxml, lisp_cl-interpol,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_md5 lisp_closer-mop lisp_cxml lisp_cl-interpol  ];
      inherit stdenv;
      systemName = "bknr.impex";
      
      sourceProject = "${lisp-project_bknr-datastore}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_md5} ${lisp_closer-mop} ${lisp_cxml} ${lisp_cl-interpol}";
      name = "lisp_bknr-impex-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
