
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-nxt, 
   lisp_nxt, lisp_usocket,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_nxt lisp_usocket  ];
      inherit stdenv;
      systemName = "nxt-proxy";
      
      sourceProject = "${lisp-project_cl-nxt}";
      patches = [];
      lisp_dependencies = "${lisp_nxt} ${lisp_usocket}";
      name = "lisp_nxt-proxy-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
