
{ buildLispPackage, stdenv, fetchurl, lisp-project_uri-template, 
   lisp_flexi-streams, lisp_named-readtables, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_named-readtables lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "uri-template";
      
      sourceProject = "${lisp-project_uri-template}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_named-readtables} ${lisp_cl-ppcre}";
      name = "lisp_uri-template-1.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
