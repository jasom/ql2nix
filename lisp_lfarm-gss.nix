
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_cl-gss, lisp_cl-store, lisp_flexi-streams, lisp_usocket, lisp_bordeaux-threads, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gss lisp_cl-store lisp_flexi-streams lisp_usocket lisp_bordeaux-threads lisp_alexandria  ];
      inherit stdenv;
      systemName = "lfarm-gss";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gss} ${lisp_cl-store} ${lisp_flexi-streams} ${lisp_usocket} ${lisp_bordeaux-threads} ${lisp_alexandria}";
      name = "lisp_lfarm-gss-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
