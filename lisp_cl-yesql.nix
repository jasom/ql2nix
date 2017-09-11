
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-yesql, 
   lisp_asdf-package-system, lisp_alexandria, lisp_serapeum, lisp_esrap, lisp_overlord,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-package-system lisp_alexandria lisp_serapeum lisp_esrap lisp_overlord  ];
      inherit stdenv;
      systemName = "cl-yesql";
      
      sourceProject = "${lisp-project_cl-yesql}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-package-system} ${lisp_alexandria} ${lisp_serapeum} ${lisp_esrap} ${lisp_overlord}";
      name = "lisp_cl-yesql-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
