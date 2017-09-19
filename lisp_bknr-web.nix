
{ buildLispPackage, stdenv, fetchurl, lisp-project_bknr-web, 
   lisp_parenscript, lisp_bknr-datastore, lisp_xhtmlgen, lisp_drakma, lisp_hunchentoot, lisp_bknr-xml, lisp_bknr-utils, lisp_unit-test, lisp_cxml, lisp_md5, lisp_cl-gd, lisp_cl-interpol,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parenscript lisp_bknr-datastore lisp_xhtmlgen lisp_drakma lisp_hunchentoot lisp_bknr-xml lisp_bknr-utils lisp_unit-test lisp_cxml lisp_md5 lisp_cl-gd lisp_cl-interpol  ];
      inherit stdenv;
      systemName = "bknr.web";
      
      sourceProject = "${lisp-project_bknr-web}";
      patches = [];
      lisp_dependencies = "${lisp_parenscript} ${lisp_bknr-datastore} ${lisp_xhtmlgen} ${lisp_drakma} ${lisp_hunchentoot} ${lisp_bknr-xml} ${lisp_bknr-utils} ${lisp_unit-test} ${lisp_cxml} ${lisp_md5} ${lisp_cl-gd} ${lisp_cl-interpol}";
      name = "lisp_bknr-web-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
