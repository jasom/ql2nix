
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-stores, 
   lisp_weblocks, lisp_weblocks-util, lisp_metatilities, lisp_closer-mop,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_weblocks lisp_weblocks-util lisp_metatilities lisp_closer-mop  ];
      inherit stdenv;
      systemName = "weblocks-custom";
      
      sourceProject = "${lisp-project_weblocks-stores}";
      patches = [];
      lisp_dependencies = "${lisp_weblocks} ${lisp_weblocks-util} ${lisp_metatilities} ${lisp_closer-mop}";
      name = "lisp_weblocks-custom-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
