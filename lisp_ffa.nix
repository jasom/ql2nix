
{ buildLispPackage, stdenv, fetchurl, lisp-project_ffa, 
   lisp_iterate, lisp_metabang-bind, lisp_cl-utilities, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_metabang-bind lisp_cl-utilities lisp_cffi  ];
      inherit stdenv;
      systemName = "ffa";
      
      sourceProject = "${lisp-project_ffa}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_metabang-bind} ${lisp_cl-utilities} ${lisp_cffi}";
      name = "lisp_ffa-20101006-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
