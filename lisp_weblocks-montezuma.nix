
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-stores, 
   lisp_montezuma, lisp_weblocks-stores,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_montezuma lisp_weblocks-stores  ];
      inherit stdenv;
      systemName = "weblocks-montezuma";
      
      sourceProject = "${lisp-project_weblocks-stores}";
      patches = [];
      lisp_dependencies = "${lisp_montezuma} ${lisp_weblocks-stores}";
      name = "lisp_weblocks-montezuma-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
