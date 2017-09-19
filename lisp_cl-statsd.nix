
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-statsd, 
   lisp_log4cl, lisp_usocket, lisp_trivial-utf-8, lisp_safe-queue, lisp_local-time, lisp_cl-interpol, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_log4cl lisp_usocket lisp_trivial-utf-8 lisp_safe-queue lisp_local-time lisp_cl-interpol lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-statsd";
      
      sourceProject = "${lisp-project_cl-statsd}";
      patches = [];
      lisp_dependencies = "${lisp_log4cl} ${lisp_usocket} ${lisp_trivial-utf-8} ${lisp_safe-queue} ${lisp_local-time} ${lisp_cl-interpol} ${lisp_alexandria}";
      name = "lisp_cl-statsd-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
