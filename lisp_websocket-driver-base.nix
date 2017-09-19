
{ buildLispPackage, stdenv, fetchurl, lisp-project_websocket-driver, 
   lisp_bordeaux-threads, lisp_split-sequence, lisp_cl-base64, lisp_ironclad, lisp_event-emitter, lisp_fast-websocket,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_split-sequence lisp_cl-base64 lisp_ironclad lisp_event-emitter lisp_fast-websocket  ];
      inherit stdenv;
      systemName = "websocket-driver-base";
      
      sourceProject = "${lisp-project_websocket-driver}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_split-sequence} ${lisp_cl-base64} ${lisp_ironclad} ${lisp_event-emitter} ${lisp_fast-websocket}";
      name = "lisp_websocket-driver-base-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
