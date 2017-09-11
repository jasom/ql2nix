
{ buildLispPackage, stdenv, fetchurl, lisp-project_xmls-tools, 
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
      systemName = "xmls-tools";
      
      sourceProject = "${lisp-project_xmls-tools}";
      patches = [];
      lisp_dependencies = "${lisp_xmls}";
      name = "lisp_xmls-tools-20110320-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
