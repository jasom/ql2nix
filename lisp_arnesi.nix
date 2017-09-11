
{ buildLispPackage, stdenv, fetchurl, lisp-project_arnesi, 
   lisp_collectors,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_collectors  ];
      inherit stdenv;
      systemName = "arnesi";
      
      sourceProject = "${lisp-project_arnesi}";
      patches = [];
      lisp_dependencies = "${lisp_collectors}";
      name = "lisp_arnesi-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
