
{ buildLispPackage, stdenv, fetchurl, lisp-project_websocket-driver, 
   lisp_quri, lisp_fast-http, lisp_cl-ssl, lisp_usocket, lisp_clack-socket, lisp_bordeaux-threads, lisp_split-sequence, lisp_cl-base64, lisp_ironclad, lisp_event-emitter, lisp_fast-websocket,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_quri lisp_fast-http lisp_cl-ssl lisp_usocket lisp_clack-socket lisp_bordeaux-threads lisp_split-sequence lisp_cl-base64 lisp_ironclad lisp_event-emitter lisp_fast-websocket  ];
      inherit stdenv;
      systemName = "websocket-driver";
      
      sourceProject = "${lisp-project_websocket-driver}";
      patches = [];
      lisp_dependencies = "${lisp_quri} ${lisp_fast-http} ${lisp_cl-ssl} ${lisp_usocket} ${lisp_clack-socket} ${lisp_bordeaux-threads} ${lisp_split-sequence} ${lisp_cl-base64} ${lisp_ironclad} ${lisp_event-emitter} ${lisp_fast-websocket}";
      name = "lisp_websocket-driver-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
