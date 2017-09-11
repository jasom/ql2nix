
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_cl-store, lisp_flexi-streams, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_cl-store lisp_flexi-streams lisp_usocket  ];
      inherit stdenv;
      systemName = "lfarm-common";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_cl-store} ${lisp_flexi-streams} ${lisp_usocket}";
      name = "lisp_lfarm-common-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
