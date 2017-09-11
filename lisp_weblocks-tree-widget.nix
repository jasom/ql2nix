
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-tree-widget, 
   lisp_alexandria, lisp_weblocks, lisp_yaclml,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_weblocks lisp_yaclml  ];
      inherit stdenv;
      systemName = "weblocks-tree-widget";
      
      sourceProject = "${lisp-project_weblocks-tree-widget}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_weblocks} ${lisp_yaclml}";
      name = "lisp_weblocks-tree-widget-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
