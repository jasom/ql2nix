
{ buildLispPackage, stdenv, fetchurl, lisp-project_spinneret, 
   lisp_alexandria, lisp_cl-ppcre, lisp_global-vars, lisp_parenscript, lisp_serapeum, lisp_trivial-gray-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_global-vars lisp_parenscript lisp_serapeum lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "spinneret";
      
      sourceProject = "${lisp-project_spinneret}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_global-vars} ${lisp_parenscript} ${lisp_serapeum} ${lisp_trivial-gray-streams}";
      name = "lisp_spinneret-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
