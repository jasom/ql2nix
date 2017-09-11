
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks, 
   lisp_weblocks-util, lisp_weblocks-stores,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_weblocks-util lisp_weblocks-stores  ];
      inherit stdenv;
      systemName = "weblocks";
      
      sourceProject = "${lisp-project_weblocks}";
      patches = [];
      lisp_dependencies = "${lisp_weblocks-util} ${lisp_weblocks-stores}";
      name = "lisp_weblocks-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
