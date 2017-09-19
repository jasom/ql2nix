
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-utils, 
   lisp_cl-tidy, lisp_drakma, lisp_weblocks-tree-widget, lisp_clache, lisp_weblocks,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-tidy lisp_drakma lisp_weblocks-tree-widget lisp_clache lisp_weblocks  ];
      inherit stdenv;
      systemName = "weblocks-utils";
      
      sourceProject = "${lisp-project_weblocks-utils}";
      patches = [];
      lisp_dependencies = "${lisp_cl-tidy} ${lisp_drakma} ${lisp_weblocks-tree-widget} ${lisp_clache} ${lisp_weblocks}";
      name = "lisp_weblocks-utils-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
