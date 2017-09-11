
{ buildLispPackage, stdenv, fetchurl, lisp-project_mito, 
   lisp_alexandria, lisp_cl-reexport, lisp_closer-mop, lisp_dbi, lisp_mito-core, lisp_sxql,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-reexport lisp_closer-mop lisp_dbi lisp_mito-core lisp_sxql  ];
      inherit stdenv;
      systemName = "mito-migration";
      
      sourceProject = "${lisp-project_mito}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-reexport} ${lisp_closer-mop} ${lisp_dbi} ${lisp_mito-core} ${lisp_sxql}";
      name = "lisp_mito-migration-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
