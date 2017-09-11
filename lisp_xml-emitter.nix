
{ buildLispPackage, stdenv, fetchurl, lisp-project_xml-emitter, 
   lisp_cl-utilities,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-utilities  ];
      inherit stdenv;
      systemName = "xml-emitter";
      
      sourceProject = "${lisp-project_xml-emitter}";
      patches = [];
      lisp_dependencies = "${lisp_cl-utilities}";
      name = "lisp_xml-emitter-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
