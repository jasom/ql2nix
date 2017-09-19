
{ buildLispPackage, stdenv, fetchurl, lisp-project_lichat-tcp-server, 
   lisp_verbose, lisp_bordeaux-threads, lisp_usocket, lisp_lichat-serverlib, lisp_lichat-protocol,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_verbose lisp_bordeaux-threads lisp_usocket lisp_lichat-serverlib lisp_lichat-protocol  ];
      inherit stdenv;
      systemName = "lichat-tcp-server";
      
      sourceProject = "${lisp-project_lichat-tcp-server}";
      patches = [];
      lisp_dependencies = "${lisp_verbose} ${lisp_bordeaux-threads} ${lisp_usocket} ${lisp_lichat-serverlib} ${lisp_lichat-protocol}";
      name = "lisp_lichat-tcp-server-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
