
{ buildLispPackage, stdenv, fetchurl, lisp-project_jsonrpc, 
   lisp_usocket, lisp_vom, lisp_chanl, lisp_event-emitter, lisp_dissect, lisp_bordeaux-threads, lisp_yason,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_vom lisp_chanl lisp_event-emitter lisp_dissect lisp_bordeaux-threads lisp_yason  ];
      inherit stdenv;
      systemName = "jsonrpc";
      
      sourceProject = "${lisp-project_jsonrpc}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_vom} ${lisp_chanl} ${lisp_event-emitter} ${lisp_dissect} ${lisp_bordeaux-threads} ${lisp_yason}";
      name = "lisp_jsonrpc-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
