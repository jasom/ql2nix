
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-utils, 
   lisp_alexandria, lisp_arnesi, lisp_cl-fad, lisp_cl-json, lisp_cl-tidy, lisp_clache, lisp_drakma, lisp_weblocks, lisp_weblocks-custom, lisp_weblocks-stores, lisp_weblocks-tree-widget,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_arnesi lisp_cl-fad lisp_cl-json lisp_cl-tidy lisp_clache lisp_drakma lisp_weblocks lisp_weblocks-custom lisp_weblocks-stores lisp_weblocks-tree-widget  ];
      inherit stdenv;
      systemName = "weblocks-utils";
      
      sourceProject = "${lisp-project_weblocks-utils}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_arnesi} ${lisp_cl-fad} ${lisp_cl-json} ${lisp_cl-tidy} ${lisp_clache} ${lisp_drakma} ${lisp_weblocks} ${lisp_weblocks-custom} ${lisp_weblocks-stores} ${lisp_weblocks-tree-widget}";
      name = "lisp_weblocks-utils-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
