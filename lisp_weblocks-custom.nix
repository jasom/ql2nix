
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-stores, 
   lisp_trivial-garbage, lisp_weblocks, lisp_weblocks-memory, lisp_weblocks-stores,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_weblocks lisp_weblocks-memory lisp_weblocks-stores  ];
      inherit stdenv;
      systemName = "weblocks-custom";
      
      sourceProject = "${lisp-project_weblocks-stores}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_weblocks} ${lisp_weblocks-memory} ${lisp_weblocks-stores}";
      name = "lisp_weblocks-custom-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
