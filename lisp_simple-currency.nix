
{ buildLispPackage, stdenv, fetchurl, lisp-project_simple-currency, 
   lisp_cl-store, lisp_simple-date, lisp_xmls, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-store lisp_simple-date lisp_xmls lisp_drakma  ];
      inherit stdenv;
      systemName = "simple-currency";
      
      sourceProject = "${lisp-project_simple-currency}";
      patches = [];
      lisp_dependencies = "${lisp_cl-store} ${lisp_simple-date} ${lisp_xmls} ${lisp_drakma}";
      name = "lisp_simple-currency-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
