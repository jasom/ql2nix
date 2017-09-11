
{ buildLispPackage, stdenv, fetchurl, lisp-project_xmls, 
   lisp_xmls,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_xmls  ];
      inherit stdenv;
      systemName = "xmls/test";
      
      sourceProject = "${lisp-project_xmls}";
      patches = [];
      lisp_dependencies = "${lisp_xmls}";
      name = "lisp_xmls-test-1.7";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
