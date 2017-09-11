
{ buildLispPackage, stdenv, fetchurl, lisp-project_ltk, 
   lisp_ltk,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ltk  ];
      inherit stdenv;
      systemName = "ltk-remote";
      
      sourceProject = "${lisp-project_ltk}";
      patches = [];
      lisp_dependencies = "${lisp_ltk}";
      name = "lisp_ltk-remote-20150113-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
