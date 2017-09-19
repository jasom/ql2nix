
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-syslog, 
   lisp_local-time, lisp_usocket, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_usocket lisp_cffi  ];
      inherit stdenv;
      systemName = "cl-syslog";
      
      sourceProject = "${lisp-project_cl-syslog}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_usocket} ${lisp_cffi}";
      name = "lisp_cl-syslog-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
