
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-stores, 
   lisp_postmodern, lisp_weblocks, lisp_weblocks-stores,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_postmodern lisp_weblocks lisp_weblocks-stores  ];
      inherit stdenv;
      systemName = "weblocks-postmodern";
      
      sourceProject = "${lisp-project_weblocks-stores}";
      patches = [];
      lisp_dependencies = "${lisp_postmodern} ${lisp_weblocks} ${lisp_weblocks-stores}";
      name = "lisp_weblocks-postmodern-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
