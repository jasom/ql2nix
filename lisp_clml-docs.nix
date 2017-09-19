
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_array-operations, lisp_lparallel, lisp_introspect-environment, lisp_drakma, lisp_cl-fad, lisp_parse-number, lisp_alexandria, lisp_clod,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_array-operations lisp_lparallel lisp_introspect-environment lisp_drakma lisp_cl-fad lisp_parse-number lisp_alexandria lisp_clod  ];
      inherit stdenv;
      systemName = "clml.docs";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_array-operations} ${lisp_lparallel} ${lisp_introspect-environment} ${lisp_drakma} ${lisp_cl-fad} ${lisp_parse-number} ${lisp_alexandria} ${lisp_clod}";
      name = "lisp_clml-docs-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
