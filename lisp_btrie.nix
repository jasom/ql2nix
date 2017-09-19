
{ buildLispPackage, stdenv, fetchurl, lisp-project_btrie, 
   lisp_lift, lisp_split-sequence, lisp_arnesi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_split-sequence lisp_arnesi  ];
      inherit stdenv;
      systemName = "btrie";
      
      sourceProject = "${lisp-project_btrie}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_split-sequence} ${lisp_arnesi}";
      name = "lisp_btrie-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
