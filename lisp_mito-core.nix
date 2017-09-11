
{ buildLispPackage, stdenv, fetchurl, lisp-project_mito, 
   lisp_alexandria, lisp_cl-ppcre, lisp_cl-reexport, lisp_closer-mop, lisp_dbi, lisp_dissect, lisp_local-time, lisp_optima, lisp_sxql,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_cl-reexport lisp_closer-mop lisp_dbi lisp_dissect lisp_local-time lisp_optima lisp_sxql  ];
      inherit stdenv;
      systemName = "mito-core";
      
      sourceProject = "${lisp-project_mito}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_cl-reexport} ${lisp_closer-mop} ${lisp_dbi} ${lisp_dissect} ${lisp_local-time} ${lisp_optima} ${lisp_sxql}";
      name = "lisp_mito-core-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
