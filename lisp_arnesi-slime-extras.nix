
{ buildLispPackage, stdenv, fetchurl, lisp-project_arnesi, 
   lisp_swank, lisp_collectors,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_swank lisp_collectors  ];
      inherit stdenv;
      systemName = "arnesi/slime-extras";
      
      sourceProject = "${lisp-project_arnesi}";
      patches = [];
      lisp_dependencies = "${lisp_swank} ${lisp_collectors}";
      name = "lisp_arnesi-slime-extras-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
