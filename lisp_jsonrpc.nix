
{ buildLispPackage, stdenv, fetchurl, lisp-project_jsonrpc, 
   lisp_yason, lisp_bordeaux-threads, lisp_dissect, lisp_event-emitter, lisp_chanl, lisp_vom, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_yason lisp_bordeaux-threads lisp_dissect lisp_event-emitter lisp_chanl lisp_vom lisp_usocket  ];
      inherit stdenv;
      systemName = "jsonrpc";
      
      sourceProject = "${lisp-project_jsonrpc}";
      patches = [];
      lisp_dependencies = "${lisp_yason} ${lisp_bordeaux-threads} ${lisp_dissect} ${lisp_event-emitter} ${lisp_chanl} ${lisp_vom} ${lisp_usocket}";
      name = "lisp_jsonrpc-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
