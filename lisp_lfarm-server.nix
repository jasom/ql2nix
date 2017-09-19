
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_cl-store, lisp_flexi-streams, lisp_bordeaux-threads, lisp_alexandria, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-store lisp_flexi-streams lisp_bordeaux-threads lisp_alexandria lisp_usocket  ];
      inherit stdenv;
      systemName = "lfarm-server";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-store} ${lisp_flexi-streams} ${lisp_bordeaux-threads} ${lisp_alexandria} ${lisp_usocket}";
      name = "lisp_lfarm-server-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
