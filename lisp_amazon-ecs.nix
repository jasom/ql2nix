
{ buildLispPackage, stdenv, fetchurl, lisp-project_amazon-ecs, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_cl-ppcre, lisp_drakma, lisp_hunchentoot, lisp_ironclad, lisp_net-telent-date, lisp_parse-number, lisp_trivial-http, lisp_xml-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_cl-ppcre lisp_drakma lisp_hunchentoot lisp_ironclad lisp_net-telent-date lisp_parse-number lisp_trivial-http lisp_xml-mop  ];
      inherit stdenv;
      systemName = "amazon-ecs";
      
      sourceProject = "${lisp-project_amazon-ecs}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_cl-ppcre} ${lisp_drakma} ${lisp_hunchentoot} ${lisp_ironclad} ${lisp_net-telent-date} ${lisp_parse-number} ${lisp_trivial-http} ${lisp_xml-mop}";
      name = "lisp_amazon-ecs-20110418-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
