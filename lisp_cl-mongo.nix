
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mongo, 
   lisp_usocket, lisp_split-sequence, lisp_parenscript, lisp_lisp-unit, lisp_documentation-template, lisp_bordeaux-threads, lisp_babel, lisp_uuid,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_split-sequence lisp_parenscript lisp_lisp-unit lisp_documentation-template lisp_bordeaux-threads lisp_babel lisp_uuid  ];
      inherit stdenv;
      systemName = "cl-mongo";
      
      sourceProject = "${lisp-project_cl-mongo}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_split-sequence} ${lisp_parenscript} ${lisp_lisp-unit} ${lisp_documentation-template} ${lisp_bordeaux-threads} ${lisp_babel} ${lisp_uuid}";
      name = "lisp_cl-mongo-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
