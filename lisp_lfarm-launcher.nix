
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_cl-store, lisp_flexi-streams, lisp_bordeaux-threads, lisp_alexandria, lisp_usocket, lisp_external-program,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-store lisp_flexi-streams lisp_bordeaux-threads lisp_alexandria lisp_usocket lisp_external-program  ];
      inherit stdenv;
      systemName = "lfarm-launcher";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-store} ${lisp_flexi-streams} ${lisp_bordeaux-threads} ${lisp_alexandria} ${lisp_usocket} ${lisp_external-program}";
      name = "lisp_lfarm-launcher-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
