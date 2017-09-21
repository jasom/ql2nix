
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks, 
   lisp_weblocks-stores, lisp_ironclad, lisp_pretty-function, lisp_parse-number, lisp_trivial-timeout, lisp_html-template, lisp_salza2, lisp_f-underscore, lisp_metatilities, lisp_cl-cont, lisp_optima, lisp_parenscript, lisp_cl-who, lisp_cl-json, lisp_puri, lisp_hunchentoot, lisp_closer-mop,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_weblocks-stores lisp_ironclad lisp_pretty-function lisp_parse-number lisp_trivial-timeout lisp_html-template lisp_salza2 lisp_f-underscore lisp_metatilities lisp_cl-cont lisp_optima lisp_parenscript lisp_cl-who lisp_cl-json lisp_puri lisp_hunchentoot lisp_closer-mop  ];
      inherit stdenv;
      systemName = "weblocks";
      
      sourceProject = "${lisp-project_weblocks}";
      patches = [];
      lisp_dependencies = "${lisp_weblocks-stores} ${lisp_ironclad} ${lisp_pretty-function} ${lisp_parse-number} ${lisp_trivial-timeout} ${lisp_html-template} ${lisp_salza2} ${lisp_f-underscore} ${lisp_metatilities} ${lisp_cl-cont} ${lisp_optima} ${lisp_parenscript} ${lisp_cl-who} ${lisp_cl-json} ${lisp_puri} ${lisp_hunchentoot} ${lisp_closer-mop}";
      name = "lisp_weblocks-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }