
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_introspect-environment, lisp_drakma, lisp_cl-fad, lisp_cl-ppcre, lisp_parse-number, lisp_iterate, lisp_alexandria,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_introspect-environment lisp_drakma lisp_cl-fad lisp_cl-ppcre lisp_parse-number lisp_iterate lisp_alexandria  ];
      inherit stdenv;
      systemName = "clml.som";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_introspect-environment} ${lisp_drakma} ${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_parse-number} ${lisp_iterate} ${lisp_alexandria}";
      name = "lisp_clml-som-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }