
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_cl-store, lisp_flexi-streams, lisp_lparallel, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-store lisp_flexi-streams lisp_lparallel lisp_usocket  ];
      inherit stdenv;
      systemName = "lfarm-client";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-store} ${lisp_flexi-streams} ${lisp_lparallel} ${lisp_usocket}";
      name = "lisp_lfarm-client-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
