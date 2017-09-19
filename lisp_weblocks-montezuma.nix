
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-stores, 
   lisp_weblocks-util, lisp_metatilities, lisp_closer-mop, lisp_montezuma,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_weblocks-util lisp_metatilities lisp_closer-mop lisp_montezuma  ];
      inherit stdenv;
      systemName = "weblocks-montezuma";
      
      sourceProject = "${lisp-project_weblocks-stores}";
      patches = [];
      lisp_dependencies = "${lisp_weblocks-util} ${lisp_metatilities} ${lisp_closer-mop} ${lisp_montezuma}";
      name = "lisp_weblocks-montezuma-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
