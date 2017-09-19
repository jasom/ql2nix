
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-nxt, 
   lisp_usocket, lisp_static-vectors, lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_static-vectors lisp_cffi  ];
      inherit stdenv;
      systemName = "nxt-proxy";
      
      sourceProject = "${lisp-project_cl-nxt}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_static-vectors} ${lisp_cffi}";
      name = "lisp_nxt-proxy-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
