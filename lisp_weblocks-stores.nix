
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-stores, 
   lisp_weblocks-util, lisp_metatilities, lisp_closer-mop,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_weblocks-util lisp_metatilities lisp_closer-mop  ];
      inherit stdenv;
      systemName = "weblocks-stores";
      NoBundle = 1;
      sourceProject = "${lisp-project_weblocks-stores}";
      patches = [];
      lisp_dependencies = "${lisp_weblocks-util} ${lisp_metatilities} ${lisp_closer-mop}";
      name = "lisp_weblocks-stores-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
