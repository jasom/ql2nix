
{ buildLispPackage, stdenv, fetchurl, lisp-project_hl7-client, 
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
      systemName = "hl7-client";
      
      sourceProject = "${lisp-project_hl7-client}";
      patches = [];
      lisp_dependencies = "${lisp_usocket}";
      name = "lisp_hl7-client-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
