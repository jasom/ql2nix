
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_lparallel, lisp_introspect-environment, lisp_drakma, lisp_cl-fad, lisp_cl-ppcre, lisp_parse-number, lisp_iterate, lisp_alexandria,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lparallel lisp_introspect-environment lisp_drakma lisp_cl-fad lisp_cl-ppcre lisp_parse-number lisp_iterate lisp_alexandria  ];
      inherit stdenv;
      systemName = "clml.svm";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_lparallel} ${lisp_introspect-environment} ${lisp_drakma} ${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_parse-number} ${lisp_iterate} ${lisp_alexandria}";
      name = "lisp_clml-svm-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
