
{ buildLispPackage, stdenv, fetchurl, lisp-project_mito, 
   lisp_local-time, lisp_cl-reexport, lisp_dissect, lisp_cl-ppcre, lisp_sxql, lisp_dbi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_cl-reexport lisp_dissect lisp_cl-ppcre lisp_sxql lisp_dbi  ];
      inherit stdenv;
      systemName = "mito";
      
      sourceProject = "${lisp-project_mito}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_cl-reexport} ${lisp_dissect} ${lisp_cl-ppcre} ${lisp_sxql} ${lisp_dbi}";
      name = "lisp_mito-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
