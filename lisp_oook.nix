
{ buildLispPackage, stdenv, fetchurl, lisp-project_oook, 
   lisp_spinneret, lisp_parse-number, lisp_jonathan, lisp_clsql, lisp_closer-mop, lisp_cl-inflector, lisp_anaphora, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_spinneret lisp_parse-number lisp_jonathan lisp_clsql lisp_closer-mop lisp_cl-inflector lisp_anaphora lisp_alexandria  ];
      inherit stdenv;
      systemName = "oook";
      
      sourceProject = "${lisp-project_oook}";
      patches = [];
      lisp_dependencies = "${lisp_spinneret} ${lisp_parse-number} ${lisp_jonathan} ${lisp_clsql} ${lisp_closer-mop} ${lisp_cl-inflector} ${lisp_anaphora} ${lisp_alexandria}";
      name = "lisp_oook-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
