
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-doc, 
   lisp_alexandria, lisp_anaphora, lisp_closer-mop, lisp_local-time, lisp_quri, lisp_trivial-types,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_closer-mop lisp_local-time lisp_quri lisp_trivial-types  ];
      inherit stdenv;
      systemName = "common-doc";
      
      sourceProject = "${lisp-project_common-doc}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_closer-mop} ${lisp_local-time} ${lisp_quri} ${lisp_trivial-types}";
      name = "lisp_common-doc-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
