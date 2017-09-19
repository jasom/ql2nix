
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-examples, 
   lisp_clsql-fluid, lisp_clsql, lisp_weblocks,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql-fluid lisp_clsql lisp_weblocks  ];
      inherit stdenv;
      systemName = "weblocks-clsql-demo";
      
      sourceProject = "${lisp-project_weblocks-examples}";
      patches = [];
      lisp_dependencies = "${lisp_clsql-fluid} ${lisp_clsql} ${lisp_weblocks}";
      name = "lisp_weblocks-clsql-demo-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
