
{ buildLispPackage, stdenv, fetchurl, lisp-project_metatilities, 
   lisp_metatilities-base, lisp_moptilities, lisp_cl-containers, lisp_metabang-bind,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metatilities-base lisp_moptilities lisp_cl-containers lisp_metabang-bind  ];
      inherit stdenv;
      systemName = "metatilities";
      
      sourceProject = "${lisp-project_metatilities}";
      patches = [];
      lisp_dependencies = "${lisp_metatilities-base} ${lisp_moptilities} ${lisp_cl-containers} ${lisp_metabang-bind}";
      name = "lisp_metatilities-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
