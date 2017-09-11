
{ buildLispPackage, stdenv, fetchurl, lisp-project_rfc3339-timestamp, 
   lisp_lisp-unit, lisp_rfc3339-timestamp,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lisp-unit lisp_rfc3339-timestamp  ];
      inherit stdenv;
      systemName = "rfc3339-timestamp-test";
      
      sourceProject = "${lisp-project_rfc3339-timestamp}";
      patches = [];
      lisp_dependencies = "${lisp_lisp-unit} ${lisp_rfc3339-timestamp}";
      name = "lisp_rfc3339-timestamp-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
