
{ buildLispPackage, stdenv, fetchurl, lisp-project_simple-logger, 
   lisp_alexandria, lisp_local-time,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_local-time  ];
      inherit stdenv;
      systemName = "simple-logger";
      
      sourceProject = "${lisp-project_simple-logger}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_local-time}";
      name = "lisp_simple-logger-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
