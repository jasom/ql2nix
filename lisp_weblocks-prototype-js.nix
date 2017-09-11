
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-prototype-js, 
   lisp_weblocks, lisp_weblocks-utils,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_weblocks lisp_weblocks-utils  ];
      inherit stdenv;
      systemName = "weblocks-prototype-js";
      
      sourceProject = "${lisp-project_weblocks-prototype-js}";
      patches = [];
      lisp_dependencies = "${lisp_weblocks} ${lisp_weblocks-utils}";
      name = "lisp_weblocks-prototype-js-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
