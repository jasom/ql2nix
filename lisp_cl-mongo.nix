
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mongo, 
   lisp_babel, lisp_bordeaux-threads, lisp_documentation-template, lisp_lisp-unit, lisp_parenscript, lisp_split-sequence, lisp_usocket, lisp_uuid,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_bordeaux-threads lisp_documentation-template lisp_lisp-unit lisp_parenscript lisp_split-sequence lisp_usocket lisp_uuid  ];
      inherit stdenv;
      systemName = "cl-mongo";
      
      sourceProject = "${lisp-project_cl-mongo}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_bordeaux-threads} ${lisp_documentation-template} ${lisp_lisp-unit} ${lisp_parenscript} ${lisp_split-sequence} ${lisp_usocket} ${lisp_uuid}";
      name = "lisp_cl-mongo-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
