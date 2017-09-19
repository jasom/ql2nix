
{ buildLispPackage, stdenv, fetchurl, lisp-project_buildnode, 
   lisp_closure-html, lisp_collectors, lisp_cl-interpol, lisp_swank, lisp_split-sequence, lisp_flexi-streams, lisp_iterate, lisp_cxml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closure-html lisp_collectors lisp_cl-interpol lisp_swank lisp_split-sequence lisp_flexi-streams lisp_iterate lisp_cxml  ];
      inherit stdenv;
      systemName = "buildnode-excel";
      
      sourceProject = "${lisp-project_buildnode}";
      patches = [];
      lisp_dependencies = "${lisp_closure-html} ${lisp_collectors} ${lisp_cl-interpol} ${lisp_swank} ${lisp_split-sequence} ${lisp_flexi-streams} ${lisp_iterate} ${lisp_cxml}";
      name = "lisp_buildnode-excel-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
