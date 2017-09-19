
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-doc, 
   lisp_closer-mop, lisp_anaphora, lisp_quri, lisp_local-time, lisp_trivial-types,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_anaphora lisp_quri lisp_local-time lisp_trivial-types  ];
      inherit stdenv;
      systemName = "common-doc-tex";
      
      sourceProject = "${lisp-project_common-doc}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_anaphora} ${lisp_quri} ${lisp_local-time} ${lisp_trivial-types}";
      name = "lisp_common-doc-tex-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
