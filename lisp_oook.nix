
{ buildLispPackage, stdenv, fetchurl, lisp-project_oook, 
   lisp_alexandria, lisp_anaphora, lisp_cl-inflector, lisp_closer-mop, lisp_clsql, lisp_jonathan, lisp_parse-number, lisp_spinneret,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_cl-inflector lisp_closer-mop lisp_clsql lisp_jonathan lisp_parse-number lisp_spinneret  ];
      inherit stdenv;
      systemName = "oook";
      
      sourceProject = "${lisp-project_oook}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_cl-inflector} ${lisp_closer-mop} ${lisp_clsql} ${lisp_jonathan} ${lisp_parse-number} ${lisp_spinneret}";
      name = "lisp_oook-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
