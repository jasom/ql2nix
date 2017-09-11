
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-stores, 
   lisp_closer-mop, lisp_clsql, lisp_clsql-fluid, lisp_metatilities, lisp_weblocks-stores, lisp_weblocks-util,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_clsql lisp_clsql-fluid lisp_metatilities lisp_weblocks-stores lisp_weblocks-util  ];
      inherit stdenv;
      systemName = "weblocks-clsql";
      
      sourceProject = "${lisp-project_weblocks-stores}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_clsql} ${lisp_clsql-fluid} ${lisp_metatilities} ${lisp_weblocks-stores} ${lisp_weblocks-util}";
      name = "lisp_weblocks-clsql-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
