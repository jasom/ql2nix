
{ buildLispPackage, stdenv, fetchurl, lisp-project_lichat-tcp-client, 
   lisp_verbose, lisp_bordeaux-threads, lisp_usocket, lisp_lichat-protocol,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_verbose lisp_bordeaux-threads lisp_usocket lisp_lichat-protocol  ];
      inherit stdenv;
      systemName = "lichat-tcp-client";
      
      sourceProject = "${lisp-project_lichat-tcp-client}";
      patches = [];
      lisp_dependencies = "${lisp_verbose} ${lisp_bordeaux-threads} ${lisp_usocket} ${lisp_lichat-protocol}";
      name = "lisp_lichat-tcp-client-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
