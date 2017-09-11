
{ buildLispPackage, stdenv, fetchurl, lisp-project_btrie, 
   lisp_arnesi, lisp_lift, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_arnesi lisp_lift lisp_split-sequence  ];
      inherit stdenv;
      systemName = "btrie";
      
      sourceProject = "${lisp-project_btrie}";
      patches = [];
      lisp_dependencies = "${lisp_arnesi} ${lisp_lift} ${lisp_split-sequence}";
      name = "lisp_btrie-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
