
{ buildLispPackage, stdenv, fetchurl, lisp-project_genie, 
   lisp_alexandria, lisp_cl-variates, lisp_simple-logger,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-variates lisp_simple-logger  ];
      inherit stdenv;
      systemName = "genie";
      
      sourceProject = "${lisp-project_genie}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-variates} ${lisp_simple-logger}";
      name = "lisp_genie-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
