
{ buildLispPackage, stdenv, fetchurl, lisp-project_3bmd, 
   lisp_3bmd,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_3bmd  ];
      inherit stdenv;
      systemName = "3bmd-ext-wiki-links";
      
      sourceProject = "${lisp-project_3bmd}";
      patches = [];
      lisp_dependencies = "${lisp_3bmd}";
      name = "lisp_3bmd-ext-wiki-links-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
