
{ buildLispPackage, stdenv, fetchurl, lisp-project_uri-template, 
   lisp_eos, lisp_uri-template,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_eos lisp_uri-template  ];
      inherit stdenv;
      systemName = "uri-template.test";
      
      sourceProject = "${lisp-project_uri-template}";
      patches = [];
      lisp_dependencies = "${lisp_eos} ${lisp_uri-template}";
      name = "lisp_uri-template-test-1.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
