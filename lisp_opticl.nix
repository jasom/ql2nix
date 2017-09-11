
{ buildLispPackage, stdenv, fetchurl, lisp-project_opticl, 
   lisp_alexandria, lisp_retrospectiff, lisp_zpng, lisp_png-read, lisp_skippy, lisp_cl-tga,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_retrospectiff lisp_zpng lisp_png-read lisp_skippy lisp_cl-tga  ];
      inherit stdenv;
      systemName = "opticl";
      
      sourceProject = "${lisp-project_opticl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_retrospectiff} ${lisp_zpng} ${lisp_png-read} ${lisp_skippy} ${lisp_cl-tga}";
      name = "lisp_opticl-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
