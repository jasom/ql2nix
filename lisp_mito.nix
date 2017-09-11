
{ buildLispPackage, stdenv, fetchurl, lisp-project_mito, 
   lisp_cl-reexport, lisp_mito-core, lisp_mito-migration,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-reexport lisp_mito-core lisp_mito-migration  ];
      inherit stdenv;
      systemName = "mito";
      
      sourceProject = "${lisp-project_mito}";
      patches = [];
      lisp_dependencies = "${lisp_cl-reexport} ${lisp_mito-core} ${lisp_mito-migration}";
      name = "lisp_mito-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
