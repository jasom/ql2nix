
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-stores, 
   lisp_weblocks, lisp_postmodern,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_weblocks lisp_postmodern  ];
      inherit stdenv;
      systemName = "weblocks-postmodern";
      
      sourceProject = "${lisp-project_weblocks-stores}";
      patches = [];
      lisp_dependencies = "${lisp_weblocks} ${lisp_postmodern}";
      name = "lisp_weblocks-postmodern-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
