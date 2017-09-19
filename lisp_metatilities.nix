
{ buildLispPackage, stdenv, fetchurl, lisp-project_metatilities, 
   lisp_metabang-bind, lisp_cl-containers, lisp_moptilities, lisp_metatilities-base,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metabang-bind lisp_cl-containers lisp_moptilities lisp_metatilities-base  ];
      inherit stdenv;
      systemName = "metatilities";
      
      sourceProject = "${lisp-project_metatilities}";
      patches = [];
      lisp_dependencies = "${lisp_metabang-bind} ${lisp_cl-containers} ${lisp_moptilities} ${lisp_metatilities-base}";
      name = "lisp_metatilities-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
