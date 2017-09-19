
{ buildLispPackage, stdenv, fetchurl, lisp-project_genie, 
   lisp_simple-logger, lisp_cl-variates, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_simple-logger lisp_cl-variates lisp_alexandria  ];
      inherit stdenv;
      systemName = "genie";
      
      sourceProject = "${lisp-project_genie}";
      patches = [];
      lisp_dependencies = "${lisp_simple-logger} ${lisp_cl-variates} ${lisp_alexandria}";
      name = "lisp_genie-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
