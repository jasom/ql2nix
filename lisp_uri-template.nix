
{ buildLispPackage, stdenv, fetchurl, lisp-project_uri-template, 
   lisp_cl-ppcre, lisp_flexi-streams, lisp_named-readtables,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_flexi-streams lisp_named-readtables  ];
      inherit stdenv;
      systemName = "uri-template";
      
      sourceProject = "${lisp-project_uri-template}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_flexi-streams} ${lisp_named-readtables}";
      name = "lisp_uri-template-1.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
