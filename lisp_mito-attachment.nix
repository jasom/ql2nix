
{ buildLispPackage, stdenv, fetchurl, lisp-project_mito-attachment, 
   lisp_uuid, lisp_trivial-mimes, lisp_lack-component, lisp_zs3, lisp_mito,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_uuid lisp_trivial-mimes lisp_lack-component lisp_zs3 lisp_mito  ];
      inherit stdenv;
      systemName = "mito-attachment";
      
      sourceProject = "${lisp-project_mito-attachment}";
      patches = [];
      lisp_dependencies = "${lisp_uuid} ${lisp_trivial-mimes} ${lisp_lack-component} ${lisp_zs3} ${lisp_mito}";
      name = "lisp_mito-attachment-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
