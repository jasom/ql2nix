
{ buildLispPackage, stdenv, fetchurl, lisp-project_lichat-ws-server, 
   lisp_verbose, lisp_hunchensocket, lisp_lichat-serverlib, lisp_lichat-protocol,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_verbose lisp_hunchensocket lisp_lichat-serverlib lisp_lichat-protocol  ];
      inherit stdenv;
      systemName = "lichat-ws-server";
      
      sourceProject = "${lisp-project_lichat-ws-server}";
      patches = [];
      lisp_dependencies = "${lisp_verbose} ${lisp_hunchensocket} ${lisp_lichat-serverlib} ${lisp_lichat-protocol}";
      name = "lisp_lichat-ws-server-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
