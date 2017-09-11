
{ buildLispPackage, stdenv, fetchurl, lisp-project_simple-currency, 
   lisp_cl-store, lisp_drakma, lisp_simple-date, lisp_split-sequence, lisp_xmls,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-store lisp_drakma lisp_simple-date lisp_split-sequence lisp_xmls  ];
      inherit stdenv;
      systemName = "simple-currency";
      
      sourceProject = "${lisp-project_simple-currency}";
      patches = [];
      lisp_dependencies = "${lisp_cl-store} ${lisp_drakma} ${lisp_simple-date} ${lisp_split-sequence} ${lisp_xmls}";
      name = "lisp_simple-currency-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
