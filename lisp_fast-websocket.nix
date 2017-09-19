
{ buildLispPackage, stdenv, fetchurl, lisp-project_fast-websocket, 
   lisp_trivial-utf-8, lisp_fast-io,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-utf-8 lisp_fast-io  ];
      inherit stdenv;
      systemName = "fast-websocket";
      
      sourceProject = "${lisp-project_fast-websocket}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-utf-8} ${lisp_fast-io}";
      name = "lisp_fast-websocket-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
