
{ buildLispPackage, stdenv, fetchurl, lisp-project_opticl, 
   lisp_cl-tga, lisp_skippy, lisp_pngload, lisp_zpng, lisp_retrospectiff, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-tga lisp_skippy lisp_pngload lisp_zpng lisp_retrospectiff lisp_alexandria  ];
      inherit stdenv;
      systemName = "opticl";
      
      sourceProject = "${lisp-project_opticl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-tga} ${lisp_skippy} ${lisp_pngload} ${lisp_zpng} ${lisp_retrospectiff} ${lisp_alexandria}";
      name = "lisp_opticl-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
