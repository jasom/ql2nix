
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-amqp, 
   lisp_log4cl, lisp_fast-io, lisp_trivial-utf-8, lisp_collectors, lisp_local-time, lisp_wu-decimal, lisp_cl-interpol, lisp_nibbles, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_log4cl lisp_fast-io lisp_trivial-utf-8 lisp_collectors lisp_local-time lisp_wu-decimal lisp_cl-interpol lisp_nibbles lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-amqp";
      
      sourceProject = "${lisp-project_cl-amqp}";
      patches = [];
      lisp_dependencies = "${lisp_log4cl} ${lisp_fast-io} ${lisp_trivial-utf-8} ${lisp_collectors} ${lisp_local-time} ${lisp_wu-decimal} ${lisp_cl-interpol} ${lisp_nibbles} ${lisp_alexandria}";
      name = "lisp_cl-amqp-v0.4.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
