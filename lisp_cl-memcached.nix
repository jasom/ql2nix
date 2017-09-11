
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-memcached, 
   lisp_babel, lisp_pooler, lisp_split-sequence, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_pooler lisp_split-sequence lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-memcached";
      
      sourceProject = "${lisp-project_cl-memcached}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_pooler} ${lisp_split-sequence} ${lisp_usocket}";
      name = "lisp_cl-memcached-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
