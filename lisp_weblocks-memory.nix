
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-stores, 
   lisp_cl-ppcre, lisp_metatilities, lisp_weblocks-stores,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_metatilities lisp_weblocks-stores  ];
      inherit stdenv;
      systemName = "weblocks-memory";
      
      sourceProject = "${lisp-project_weblocks-stores}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_metatilities} ${lisp_weblocks-stores}";
      name = "lisp_weblocks-memory-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
