
{ buildLispPackage, stdenv, fetchurl, lisp-project_websocket-driver, 
   lisp_bordeaux-threads, lisp_cl-base64, lisp_event-emitter, lisp_fast-io, lisp_fast-websocket, lisp_ironclad, lisp_split-sequence,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cl-base64 lisp_event-emitter lisp_fast-io lisp_fast-websocket lisp_ironclad lisp_split-sequence  ];
      inherit stdenv;
      systemName = "websocket-driver-base";
      
      sourceProject = "${lisp-project_websocket-driver}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cl-base64} ${lisp_event-emitter} ${lisp_fast-io} ${lisp_fast-websocket} ${lisp_ironclad} ${lisp_split-sequence}";
      name = "lisp_websocket-driver-base-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
