
{ buildLispPackage, stdenv, fetchurl, lisp-project_fast-websocket, 
   lisp_fast-io, lisp_fast-websocket, lisp_prove, lisp_prove-asdf, lisp_trivial-utf-8,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fast-io lisp_fast-websocket lisp_prove lisp_prove-asdf lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "fast-websocket-test";
      
      sourceProject = "${lisp-project_fast-websocket}";
      patches = [];
      lisp_dependencies = "${lisp_fast-io} ${lisp_fast-websocket} ${lisp_prove} ${lisp_prove-asdf} ${lisp_trivial-utf-8}";
      name = "lisp_fast-websocket-test-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
