
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks, 
   lisp_closer-mop, lisp_hunchentoot, lisp_puri, lisp_cl-json, lisp_cl-who, lisp_parenscript, lisp_optima, lisp_cl-cont, lisp_metatilities, lisp_f-underscore, lisp_salza2, lisp_html-template, lisp_trivial-timeout, lisp_parse-number, lisp_pretty-function, lisp_ironclad,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_hunchentoot lisp_puri lisp_cl-json lisp_cl-who lisp_parenscript lisp_optima lisp_cl-cont lisp_metatilities lisp_f-underscore lisp_salza2 lisp_html-template lisp_trivial-timeout lisp_parse-number lisp_pretty-function lisp_ironclad  ];
      inherit stdenv;
      systemName = "weblocks-util";
      
      sourceProject = "${lisp-project_weblocks}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_hunchentoot} ${lisp_puri} ${lisp_cl-json} ${lisp_cl-who} ${lisp_parenscript} ${lisp_optima} ${lisp_cl-cont} ${lisp_metatilities} ${lisp_f-underscore} ${lisp_salza2} ${lisp_html-template} ${lisp_trivial-timeout} ${lisp_parse-number} ${lisp_pretty-function} ${lisp_ironclad}";
      name = "lisp_weblocks-util-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
