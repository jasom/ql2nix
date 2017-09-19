
{ buildLispPackage, stdenv, fetchurl, lisp-project_amazon-ecs, 
   lisp_hunchentoot, lisp_ironclad, lisp_drakma, lisp_parse-number, lisp_xml-mop, lisp_net-telent-date, lisp_trivial-http, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hunchentoot lisp_ironclad lisp_drakma lisp_parse-number lisp_xml-mop lisp_net-telent-date lisp_trivial-http lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "amazon-ecs";
      
      sourceProject = "${lisp-project_amazon-ecs}";
      patches = [];
      lisp_dependencies = "${lisp_hunchentoot} ${lisp_ironclad} ${lisp_drakma} ${lisp_parse-number} ${lisp_xml-mop} ${lisp_net-telent-date} ${lisp_trivial-http} ${lisp_cl-ppcre}";
      name = "lisp_amazon-ecs-20110418-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
