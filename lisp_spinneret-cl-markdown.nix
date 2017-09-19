
{ buildLispPackage, stdenv, fetchurl, lisp-project_spinneret, 
   lisp_trivial-gray-streams, lisp_serapeum, lisp_global-vars, lisp_alexandria, lisp_parenscript, lisp_cl-markdown,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-gray-streams lisp_serapeum lisp_global-vars lisp_alexandria lisp_parenscript lisp_cl-markdown  ];
      inherit stdenv;
      systemName = "spinneret/cl-markdown";
      
      sourceProject = "${lisp-project_spinneret}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams} ${lisp_serapeum} ${lisp_global-vars} ${lisp_alexandria} ${lisp_parenscript} ${lisp_cl-markdown}";
      name = "lisp_spinneret-cl-markdown-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
