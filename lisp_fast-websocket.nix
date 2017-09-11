
{ buildLispPackage, stdenv, fetchurl, lisp-project_fast-websocket, 
   lisp_alexandria, lisp_fast-io, lisp_trivial-utf-8,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_fast-io lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "fast-websocket";
      
      sourceProject = "${lisp-project_fast-websocket}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_fast-io} ${lisp_trivial-utf-8}";
      name = "lisp_fast-websocket-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
