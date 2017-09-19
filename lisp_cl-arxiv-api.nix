
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-arxiv-api, 
   lisp_cxml, lisp_iterate, lisp_cl-interpol, lisp_trivial-http,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cxml lisp_iterate lisp_cl-interpol lisp_trivial-http  ];
      inherit stdenv;
      systemName = "cl-arxiv-api";
      
      sourceProject = "${lisp-project_cl-arxiv-api}";
      patches = [];
      lisp_dependencies = "${lisp_cxml} ${lisp_iterate} ${lisp_cl-interpol} ${lisp_trivial-http}";
      name = "lisp_cl-arxiv-api-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
