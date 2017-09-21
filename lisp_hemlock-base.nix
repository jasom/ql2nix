
{ buildLispPackage, stdenv, fetchurl, lisp-project_hemlock, 
   lisp_command-line-arguments, lisp_cl-ppcre, lisp_iolib, lisp_osicat, lisp_prepl, lisp_iterate, lisp_trivial-gray-streams, lisp_conium, lisp_bordeaux-threads, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_command-line-arguments lisp_cl-ppcre lisp_iolib lisp_osicat lisp_prepl lisp_iterate lisp_trivial-gray-streams lisp_conium lisp_bordeaux-threads lisp_alexandria  ];
      inherit stdenv;
      systemName = "hemlock.base";
      
      sourceProject = "${lisp-project_hemlock}";
      patches = [];
      lisp_dependencies = "${lisp_command-line-arguments} ${lisp_cl-ppcre} ${lisp_iolib} ${lisp_osicat} ${lisp_prepl} ${lisp_iterate} ${lisp_trivial-gray-streams} ${lisp_conium} ${lisp_bordeaux-threads} ${lisp_alexandria}";
      name = "lisp_hemlock-base-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
