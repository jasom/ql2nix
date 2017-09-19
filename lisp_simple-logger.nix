
{ buildLispPackage, stdenv, fetchurl, lisp-project_simple-logger, 
   lisp_local-time, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_alexandria  ];
      inherit stdenv;
      systemName = "simple-logger";
      
      sourceProject = "${lisp-project_simple-logger}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_alexandria}";
      name = "lisp_simple-logger-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
