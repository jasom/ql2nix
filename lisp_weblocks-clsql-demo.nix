
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-examples, 
   lisp_metatilities, lisp_weblocks, lisp_weblocks-clsql, lisp_weblocks-stores,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metatilities lisp_weblocks lisp_weblocks-clsql lisp_weblocks-stores  ];
      inherit stdenv;
      systemName = "weblocks-clsql-demo";
      
      sourceProject = "${lisp-project_weblocks-examples}";
      patches = [];
      lisp_dependencies = "${lisp_metatilities} ${lisp_weblocks} ${lisp_weblocks-clsql} ${lisp_weblocks-stores}";
      name = "lisp_weblocks-clsql-demo-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
