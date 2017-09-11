
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-http, 
   lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket  ];
      inherit stdenv;
      systemName = "trivial-http";
      
      sourceProject = "${lisp-project_trivial-http}";
      patches = [];
      lisp_dependencies = "${lisp_usocket}";
      name = "lisp_trivial-http-20110219-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
