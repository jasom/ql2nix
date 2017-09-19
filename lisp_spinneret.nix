
{ buildLispPackage, stdenv, fetchurl, lisp-project_spinneret, 
   lisp_trivial-gray-streams, lisp_serapeum, lisp_global-vars, lisp_alexandria, lisp_parenscript,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-gray-streams lisp_serapeum lisp_global-vars lisp_alexandria lisp_parenscript  ];
      inherit stdenv;
      systemName = "spinneret";
      
      sourceProject = "${lisp-project_spinneret}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams} ${lisp_serapeum} ${lisp_global-vars} ${lisp_alexandria} ${lisp_parenscript}";
      name = "lisp_spinneret-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
