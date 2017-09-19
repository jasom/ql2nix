
{ buildLispPackage, stdenv, fetchurl, lisp-project_lfarm, 
   lisp_cl-ssl, lisp_cl-store, lisp_flexi-streams, lisp_usocket, lisp_bordeaux-threads, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl lisp_cl-store lisp_flexi-streams lisp_usocket lisp_bordeaux-threads lisp_alexandria  ];
      inherit stdenv;
      systemName = "lfarm-ssl";
      
      sourceProject = "${lisp-project_lfarm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl} ${lisp_cl-store} ${lisp_flexi-streams} ${lisp_usocket} ${lisp_bordeaux-threads} ${lisp_alexandria}";
      name = "lisp_lfarm-ssl-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
