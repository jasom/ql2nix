
{ buildLispPackage, stdenv, fetchurl, lisp-project_websocket-driver, 
   lisp_clack-socket, lisp_fast-io, lisp_fast-websocket, lisp_ironclad, lisp_trivial-utf-8, lisp_websocket-driver-base,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clack-socket lisp_fast-io lisp_fast-websocket lisp_ironclad lisp_trivial-utf-8 lisp_websocket-driver-base  ];
      inherit stdenv;
      systemName = "websocket-driver-server";
      
      sourceProject = "${lisp-project_websocket-driver}";
      patches = [];
      lisp_dependencies = "${lisp_clack-socket} ${lisp_fast-io} ${lisp_fast-websocket} ${lisp_ironclad} ${lisp_trivial-utf-8} ${lisp_websocket-driver-base}";
      name = "lisp_websocket-driver-server-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
