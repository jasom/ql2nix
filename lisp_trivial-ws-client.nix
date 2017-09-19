
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-ws, 
   lisp_cl-async, lisp_websocket-driver,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-async lisp_websocket-driver  ];
      inherit stdenv;
      systemName = "trivial-ws-client";
      
      sourceProject = "${lisp-project_trivial-ws}";
      patches = [];
      lisp_dependencies = "${lisp_cl-async} ${lisp_websocket-driver}";
      name = "lisp_trivial-ws-client-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
