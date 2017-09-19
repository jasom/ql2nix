
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_introspect-environment, lisp_cl-fad, lisp_parse-number, lisp_iterate, lisp_drakma, lisp_cl-ppcre,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_introspect-environment lisp_cl-fad lisp_parse-number lisp_iterate lisp_drakma lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "clml.data";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_introspect-environment} ${lisp_cl-fad} ${lisp_parse-number} ${lisp_iterate} ${lisp_drakma} ${lisp_cl-ppcre}";
      name = "lisp_clml-data-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
